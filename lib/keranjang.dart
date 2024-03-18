import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lji/styles/color.dart';
import 'package:lji/styles/dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Keranjang extends StatefulWidget {
  final DocumentSnapshot produkData;
  Keranjang({Key? key, required this.produkData}) : super(key: key);

  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  String? namaPembeli;
  String? userID;
  int jumlah = 1;
  void tambahkanKeKeranjang() async {
    // Mendapatkan informasi pengguna yang sedang diotentikasi
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userID = user.uid;
    } else {
      // Handle case where the user is not authenticated
      print('User not authenticated');
      return;
    }

    // Update cart di dalam dokumen pengguna
    await FirebaseFirestore.instance.collection('users').doc(userID).update({
      'cart': FieldValue.arrayUnion([
        {
          'product_id': widget
              .produkData.id, // Gunakan ID dokumen produk sebagai product_id
          'jumlah': jumlah
        }
      ])
    }).then((value) {
      print('Produk ditambahkan ke keranjang');
      Navigator.pop(
          context); // Kembali ke halaman sebelumnya setelah menambahkan ke keranjang
    }).catchError((error) {
      print('Gagal menambahkan produk ke keranjang: $error');
      // Handle error, misalnya, menampilkan pesan kesalahan kepada pengguna
    });
  }

  void beliLangsung() async {
    try {
      // Ambil informasi produk
      String gambarProduk = widget.produkData["gambar_produk"];
      String namaProduk = widget.produkData["nama_produk"];
      String variasiRasa = widget.produkData["variasi_rasa"];
      int hargaProduk = widget.produkData["harga_produk"];
      String idProduk = widget.produkData.id;

      // Hitung total barang dan harga total
      int totalBarang = 0;
      int hargaTotal = 0;

// Iterasi melalui setiap produk yang dibeli
      for (var produk in [
        {
          'nama_produk': namaProduk,
          'variasi_rasa': variasiRasa,
          'harga_produk': hargaProduk,
          'jumlah': jumlah,
          'id_produk': idProduk,
          'gambar_produk': gambarProduk,
          'total_harga': hargaProduk * jumlah
        }
      ]) {
        totalBarang += (produk['jumlah'] as num)
            .toInt(); // Tambahkan jumlah produk ke total_barang
        hargaTotal += (produk['total_harga'] as num)
            .toInt(); // Tambahkan total harga produk ke harga_total
      }

      // Mendapatkan informasi pengguna yang sedang diotentikasi
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        userID = user.uid;
        String? username = await getUsernameFromUserID(userID!);
        // Gunakan username sebagai nama pembeli
        namaPembeli = username;
      } else {
        // Handle case where the user is not authenticated
        print('User not authenticated');
        return;
      }

      // Dapatkan tanggal sekarang
      DateTime now = DateTime.now();

      // Format tanggal
      String formattedDate =
          DateFormat('d MMM, y').format(now); // Output: 1 Jan, 2024

      // Format jam
      String formattedTime = DateFormat('HH:mm').format(now); // Output: 09:15

      // Simpan pesanan ke Firebase
      DocumentReference pesananRef =
          await FirebaseFirestore.instance.collection('pesanan').add({
        'waktu_pesanan': Timestamp.now(),
        'nama_pembeli': namaPembeli, // Menyimpan nama pembeli
        'id_pembeli': userID, // Menyimpan ID pembeli
        'id_transaksi': '', // ID transaksi dapat diisi jika diperlukan
        'tanggal': formattedDate, // Menyimpan tanggal transaksi
        'jam': formattedTime,
        'produk': FieldValue.arrayUnion([
          // Menyimpan detail pesanan dalam bentuk array
          {
            'nama_produk': namaProduk,
            'variasi_rasa': variasiRasa,
            'harga_produk': hargaProduk,
            'jumlah': jumlah,
            'id_produk': idProduk,
            'gambar_produk': gambarProduk,
            'total_harga': hargaProduk * jumlah
          }
        ]),
        'status': 'pending', // Status pesanan menunggu persetujuan admin
        'total_barang': totalBarang, // Menambahkan field total_barang
        'harga_total': hargaTotal, // Menambahkan field harga_total
      });
      // Setelah dokumen ditambahkan, dapatkan ID transaksi yang dihasilkan
      String idTransaksi = pesananRef.id;

// Kemudian, perbarui dokumen dengan ID transaksi yang dihasilkan
      await pesananRef.update({'id_transaksi': idTransaksi});

      print('Pesanan berhasil diproses');
      showDialog(
        context: context,
        builder: (context) => SucessDialog(
          title: 'Berhasil',
          content: 'Pesanan berhasil diproses.',
          buttonConfirm: 'Ok',
          onButtonConfirm: () {
            Navigator.pop(context);
          },
        ),
      );
    } catch (error) {
      print('Error processing order: $error');
      // Handle error, misalnya, menampilkan pesan kesalahan kepada pengguna
      showDialog(
        context: context,
        builder: (context) => WarningDialog(
          title: 'Error',
          content: 'Gagal memproses pesanan.',
          buttonConfirm: 'Ok',
          onButtonConfirm: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  Future<String?> getUsernameFromUserID(String userID) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot userSnapshot =
          await firestore.collection('users').doc(userID).get();

      if (userSnapshot.exists) {
        return userSnapshot['username'];
      } else {
        return ''; // Atau nilai default jika pengguna tidak ditemukan
      }
    } catch (error) {
      print('Error getting owner name: $error');
      return ''; // Atau nilai default jika terjadi kesalahan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Beli Menu",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 23,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 28, 20, 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 20),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context)
                            .size
                            .width, // Sesuaikan tinggi dengan lebar untuk membuat gambar persegi
                        child: AspectRatio(
                          aspectRatio:
                              1, // Memastikan gambar tetap berbentuk persegi
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              widget.produkData["gambar_produk"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 3),
                          child: Text(
                            widget.produkData["nama_produk"],
                            style: GoogleFonts.poppins(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff030303),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              left: 2 + MediaQuery.of(context).padding.left),
                          child: Text(
                            widget.produkData["variasi_rasa"],
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: 800,
                    height: 30,
                    child: Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(widget.produkData['harga_produk']),
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Color(0xff49a013),
                      ),
                    ),
                  ),
                ],
              ), //kedua
              SizedBox(height: 20),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0x499c9c9c),
            offset: Offset(0, 0),
            blurRadius: 2,
          ),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomAppBar(
            surfaceTintColor: Colors.white,
            height: 70,
            elevation: 1,
            notchMargin: 8,
            shape: CircularNotchedRectangle(),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk memasukkan produk ke keranjang
                      tambahkanKeKeranjang();
                      print(
                          'Menambahkan ${widget.produkData["nama_produk"]} ke keranjang');
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: greenPrimary, width: 2),
                      minimumSize: Size(double.minPositive, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: greenPrimary,
                    )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Memanggil fungsi untuk membeli langsung produk
                      beliLangsung();
                      print(
                          'Membeli langsung ${widget.produkData["nama_produk"]}');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.minPositive, 50),
                      backgroundColor: Color(0xff4fb60e),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Beli Langsung',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
