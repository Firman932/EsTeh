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

import 'package:flutter/services.dart';

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
    return WillPopScope(
      onWillPop: () async {
        print('onWillPop called'); // Add this line for debugging

        // Show exit confirmation dialog
        bool exitConfirmed = await showDialog(
          context: context,
          builder: (context) => DeleteDialog(
            title: 'Peringatan',
            content: 'Apakah Anda yakin ingin keluar dari aplikasi ?',
            buttonConfirm: 'Ok',
            onButtonConfirm: () =>
                Navigator.of(context).pop(true), // Wrap this in a function
            buttonCancel: 'Batal',
            onButtonCancel: () =>
                Navigator.of(context).pop(false), // Wrap this in a function
          ),
        );

        // If user confirms exit or dialog is dismissed, exit the app
        if (exitConfirmed) {
          SystemNavigator.pop();
          return true; // Return true to prevent further handling
        }

        return false; // Return false to allow normal back navigation
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            title: Text(
              "Dashboard",
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.w500),
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
          body: Stack(
            children: [
              SingleChildScrollView(
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
                          InkWell(
                            onTap: () {
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
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.view_list,
                                    color: greenPrimary,
                                    size: 25,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "Tampilkan Semua",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: greenPrimary,
                                    ),
                                  ),
                                ],
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

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            return Center(child: Text('Tidak ada produk.'));
                          }

                          produkList = snapshot.data!.docs
                              .where((produk) =>
                                  produk['kategori_produk'] ==
                                      selectedCategory &&
                                  produk['kategori_produk'] != null)
                              .toList();

                          produkList.sort((a, b) {
                            int stokA = a['stok_produk'] as int;
                            int stokB = b['stok_produk'] as int;
                            return stokA.compareTo(stokB);
                          });

                          final List<DocumentSnapshot> limitedProdukList =
                              produkList.sublist(
                                  0, produkList.length.clamp(0, 3));

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
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitWave(
                          size: 43,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Loading',
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
