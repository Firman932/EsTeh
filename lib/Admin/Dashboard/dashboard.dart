import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/analisis.dart';
import 'package:lji/Admin/HistoryAdmin/HistoryAdmin.dart';
import 'package:lji/Admin/Notifikasi/notifikasi.dart';
import 'package:lji/Admin/Dashboard/list_menu.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';
import 'package:lji/filterUser.dart';
import 'package:lji/styles/bottomlogout.dart'; // Sesuaikan dengan lokasi file FilterUser.dart
import 'package:lji/styles/color.dart';
import 'package:lji/styles/dialog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = "Minuman";
  late Stream<QuerySnapshot> produkStream;
  List<DocumentSnapshot> produkList = [];
  bool isLoading = false;

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
          forceMaterialTransparency: true,
          title: Text(
            "Dashboard",
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              _showLogoutBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 17, top: 17),
              height: 25,
              width: 25,
              child: Image.asset(
                "assets/logout.png",
              ),
            ),
          ),
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
              width: 13,
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
              width: 16,
            ),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isLoading = true; // Set loading state to true
                        });

                        // Simulate async operation, for example fetching data
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StokProduk()),
                          );
                        }).whenComplete(() {
                          setState(() {
                            isLoading =
                                false; // Set loading state to false when operation completes
                          });
                        });
                      },
                      child: isLoading
                          ? SpinKitWave(
                              size: 25,
                              color: greenPrimary,
                            ) // Show loading indicator if isLoading is true
                          : Text(
                              "Tampilkan Semua",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: greenPrimary),
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
                      return Center(
                          child: Column(
                        children: [
                          SpinKitWave(
                            size: 43,
                            color: greenPrimary,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Loading',
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: greenPrimary),
                          )
                        ],
                      ));
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
