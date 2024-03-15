import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/analisis.dart';
import 'package:lji/Admin/HistoryAdmin/HistoryAdmin.dart';
import 'package:lji/Admin/Notifikasi/notifikasi.dart';
import 'package:lji/Admin/Dashboard/list_menu.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';
import 'package:lji/filterUser.dart';
import 'package:lji/styles/bottomlogout.dart'; // Sesuaikan dengan lokasi file FilterUser.dart

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = "Minuman";
  late Stream<QuerySnapshot> produkStream;
  List<DocumentSnapshot> produkList = [];

  @override
  void initState() {
    super.initState();

    // Panggil fungsi untuk mengambil data produk saat widget diinisialisasi
    produkStream = FirebaseFirestore.instance.collection('produk').snapshots();
    produkStream.listen((QuerySnapshot querySnapshot) {
      setState(() {
        produkList = querySnapshot.docs.toList();
      });
    });
  }

  void _showLogoutBottomSheet(BuildContext context) {
    LogoutBottomSheet.show(context, AuthService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                _showLogoutBottomSheet(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              )),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiwayatAdmin(),
                  ),
                );
              },
              child: Icon(
                Icons.history,
                size: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifikasi(),
                  ),
                );
              },
              child: Icon(
                Icons.notifications,
                size: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 13,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45),
                Analisis(),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stok",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StokProduk()),
                        );
                      },
                      child: Text(
                        "Tampilkan Semua",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                FilterUser(
                  onMinumanSelected: (category) {
                    setState(() {
                      selectedCategory = "Minuman";
                    });
                  },
                  onMakananSelected: (category) {
                    setState(() {
                      selectedCategory = "Makanan";
                    });
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: produkStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (produkList.isEmpty) {
                      return Text('Tidak ada produk.');
                    }

                    produkList = snapshot.data!.docs
                        .where((produk) =>
                            produk['kategori_produk'] == selectedCategory &&
                            produk['kategori_produk'] != null)
                        .toList();

                    produkList.sort((a, b) {
                      int stokA = a['stok_produk'] as int;
                      int stokB = b['stok_produk'] as int;
                      return stokA.compareTo(stokB);
                    });

                    final List<DocumentSnapshot> limitedProdukList =
                        produkList.sublist(0, produkList.length.clamp(0, 3));

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: limitedProdukList.length,
                      itemBuilder: (context, index) {
                        return ListMenu(
                          // Pass product data from Firestore to ListMenu
                          produkData: limitedProdukList[index],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
