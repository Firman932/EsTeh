import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lji/Admin/Notifikasi/listpesan.dart';
import 'package:lji/styles/dialog.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({
    Key? key,
  }) : super(key: key);

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  late List<DocumentSnapshot> pesananList = [];

  @override
  void initState() {
    super.initState();
    fetchDataPesanan();
  }

  void fetchDataPesanan() {
    FirebaseFirestore.instance
        .collection('pesanan')
        .where('status', isEqualTo: 'pending')
        .orderBy('waktu_pesanan', descending: true)
        .get()
        .then((querySnapshot) {
      setState(() {
        pesananList = querySnapshot.docs;
      });
    }).catchError((error) {
      print("Error fetching pesanan: $error");
    });
  }

  String getDayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      case 7:
        return 'Minggu';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Notifikasi",
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: pesananList.length,
        itemBuilder: (context, index) {
          DocumentSnapshot pesanan = pesananList[index];
          String namaPembeli = pesanan['nama_pembeli'];
          String tanggal = pesanan['tanggal'];
          String jam = pesanan['jam'];
          int totalHarga = pesanan['harga_total'];
          int totalBarang = pesanan['total_barang'];
          List<dynamic> produkList = pesanan['produk'];
          String statusPesanan = pesanan['status'];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromRGBO(156, 156, 156, 0.28999999165534972),
                        offset: Offset(0, 0),
                        blurRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.circle_notifications_rounded,
                                  color: Color.fromARGB(255, 73, 160, 19),
                                ),
                                SizedBox(width: 2),
                                Expanded(
                                  child: Text(
                                    "Dari $namaPembeli",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                          ),
                          Text(
                            tanggal,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Apakah kamu mau menerima pesanan dari user yang mau membeli produk kamu ?",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "List Pesanan: ",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: produkList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => ListPesan(
                                      produk: produkList[index],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Total : ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(totalHarga),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              if (statusPesanan == 'pending')
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Mengatur waktu sekarang
                                        DateTime now = DateTime.now();
                                        String hariPesanan = getDayName(now);
                                        // Format tanggal dan waktu
                                        String formattedDate =
                                            DateFormat('d MMM, y').format(now);
                                        String formattedTime =
                                            DateFormat('HH:mm').format(now);
                                        FirebaseFirestore.instance
                                            .collection('pesanan')
                                            .doc(pesanan.id)
                                            .update({
                                          'status': 'Ditolak',
                                          'tanggal': formattedDate,
                                          'jam': formattedTime,
                                          'waktu_pesanan': Timestamp.now(),
                                          'hari': hariPesanan,
                                        }).then((_) {
                                          setState(() {
                                            // Menghilangkan tombol setelah status diperbarui
                                            pesananList.removeAt(index);
                                          });
                                        });
                                        ;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        minimumSize: Size(0, 40),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        "Tolak",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    if (statusPesanan ==
                                        'pending') // Tampilkan tombol berdasarkan status pesanan
                                      ElevatedButton(
                                        onPressed: () {
                                          String idProduk = produkList[index]['id_produk'];
                                          DateTime now = DateTime.now();
                                          String hariPesanan = getDayName(now);
                                          // Format tanggal dan waktu
                                          String formattedDate =
                                              DateFormat('d MMM, y')
                                                  .format(now);
                                          String formattedTime =
                                              DateFormat('HH:mm').format(now);
                                          FirebaseFirestore.instance
                                              .collection('produk')
                                              .doc(idProduk)
                                              .get()
                                              .then((produkDoc) {
                                            if (produkDoc.exists) {
                                              int stokAwal =
                                                  produkDoc['stok_produk'];
                                              int jumlahDipesan =
                                                  totalBarang; // Menggunakan jumlah barang dari pesanan
                                              int stokSisa =
                                                  stokAwal - jumlahDipesan;

                                              // Pastikan stok tidak negatif
                                              if (stokSisa >= 0) {
                                                // Kurangi stok produk
                                                FirebaseFirestore.instance
                                                    .collection('produk')
                                                    .doc(idProduk)
                                                    .update({
                                                  'stok_produk': stokSisa
                                                }).then((_) {
                                                  // Jika berhasil mengurangi stok, lanjutkan dengan memperbarui status pesanan
                                                  FirebaseFirestore.instance
                                                      .collection('pesanan')
                                                      .doc(pesanan.id)
                                                      .update({
                                                    'status': 'Diterima',
                                                    'tanggal': formattedDate,
                                                    'jam': formattedTime,
                                                    'waktu_pesanan':
                                                        Timestamp.now(),
                                                    'hari': hariPesanan,
                                                  }).then((_) {
                                                    setState(() {
                                                      pesananList
                                                          .removeAt(index);
                                                    });
                                                  });
                                                });
                                              } else {
                                                // Jika stok tidak mencukupi, tampilkan pesan kesalahan atau lakukan tindakan yang sesuai
                                                print(
                                                    'Stok produk tidak mencukupi');
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return WarningDialog(
                                                        title: "Peringatan",
                                                        content:
                                                            "Stok tidak mencukupi",
                                                        buttonConfirm: "Ok",
                                                        onButtonConfirm: () {
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                  },
                                                );
                                              }
                                            } else {
                                              // Jika dokumen produk tidak ditemukan, tampilkan pesan kesalahan atau lakukan tindakan yang sesuai
                                              print('Produk tidak ditemukan');
                                            }
                                          }).catchError((error) {
                                            // Tangani kesalahan saat mengambil dokumen produk
                                            print(
                                                'Error fetching produk: $error');
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 73, 160, 19),
                                          minimumSize: Size(0, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          "Terima",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
