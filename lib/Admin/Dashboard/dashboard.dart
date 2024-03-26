import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lji/Admin/Analisis%20Uang/uang.dart';
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Pendapatan(),
                                    ),
                                  );
                                },
                                child: Container(
                                    height: 126,
                                    child: Stack(children: <Widget>[
                                      Container(
                                          height: 126,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      156, 156, 156, 0.29),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 3,
                                                )
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: StreamBuilder<int>(
                                                  stream:
                                                      getTotalPendapatanMingguan(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return SizedBox();
                                                    }
                                                    return Text(
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: 'Rp ',
                                                              decimalDigits: 0)
                                                          .format(
                                                              snapshot.data ??
                                                                  0),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    );
                                                  }),
                                            ),
                                          )),
                                      Container(
                                        width: double.infinity,
                                        height: 77,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                          ),
                                          color: Color.fromRGBO(73, 160, 19, 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset("assets/uang.png"),
                                              Text(
                                                "Uang",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ])),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Container(
                                  height: 126,
                                  child: Stack(children: <Widget>[
                                    Container(
                                      height: 126,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  156, 156, 156, 0.29),
                                              offset: Offset(0, 0),
                                              blurRadius: 3,
                                            )
                                          ]),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: StreamBuilder<QuerySnapshot>(
                                            stream: produkStream,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              }

                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return SizedBox();
                                              }

                                              // Extract product data from the snapshot
                                              final List<DocumentSnapshot>
                                                  produkList =
                                                  snapshot.data!.docs.toList();

                                              // Determine the length of the list
                                              int length = produkList.length;

                                              return Text(
                                                "$length",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 77,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                        ),
                                        color: Color.fromRGBO(73, 160, 19, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset("assets/produk.png"),
                                            Text(
                                              "Total Produk",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])),
                            )
                          ],
                        ),
                      ),
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
                            return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SpinKitWave(
                                    size: 40,
                                    color: greenPrimary,
                                  ),
                                ] // Ganti dengan indikator loading yang sesuai
                                );
                          }

                          // Ambil semua dokumen produk dari snapshot
                          final List<DocumentSnapshot> allProdukList =
                              snapshot.data!.docs;

                          // Filter produk berdasarkan kategori yang dipilih
                          final filteredProdukList = allProdukList
                              .where((produk) =>
                                  produk['kategori_produk'] ==
                                      selectedCategory &&
                                  produk['kategori_produk'] != null)
                              .toList();

                          // Jika tidak ada produk yang sesuai dengan kategori yang dipilih, tampilkan pesan
                          if (filteredProdukList.isEmpty) {
                            return Center(
                              child: Text('Tidak ada Produk'),
                            );
                          }

                          // Urutkan produk berdasarkan stok_produk
                          filteredProdukList.sort((a, b) {
                            int stokA = a['stok_produk'] as int;
                            int stokB = b['stok_produk'] as int;
                            return stokA.compareTo(stokB);
                          });

                          // Ambil tiga produk pertama setelah penyaringan dan pengurutan
                          final List<DocumentSnapshot> limitedProdukList =
                              filteredProdukList.take(3).toList();

                          // Tampilkan daftar produk yang telah difilter dan diurutkan
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

  Stream<int> getTotalPendapatanMingguan() async* {
    // Mengambil tanggal awal dan akhir minggu saat ini
    DateTime now = DateTime.now();
    DateTime awalMinggu = now.subtract(Duration(days: now.weekday - 1));
    DateTime akhirMinggu = awalMinggu.add(Duration(days: 6));

    // Menetapkan jam, menit, dan detik menjadi 00:00 untuk tanggal awal minggu
    awalMinggu =
        DateTime(awalMinggu.year, awalMinggu.month, awalMinggu.day, 0, 0, 0);

    // Menetapkan jam, menit, dan detik menjadi 23:59 untuk tanggal akhir minggu
    akhirMinggu = DateTime(
        akhirMinggu.year, akhirMinggu.month, akhirMinggu.day, 23, 59, 59);

    // Membuat format string untuk tanggal awal dan akhir minggu
    String awalMingguStr = _formatTanggal(awalMinggu);
    String akhirMingguStr = _formatTanggal(akhirMinggu);

    try {
      // Mengambil data pendapatan mingguan dari Firestore
      final snapshot = await FirebaseFirestore.instance
          .collection('pendapatan_mingguan')
          .doc('$awalMingguStr-$akhirMingguStr')
          .get();

      if (snapshot.exists) {
        // Jika dokumen ditemukan, kembalikan nilai total_harga
        yield snapshot['total_harga'];
      } else {
        // Jika dokumen tidak ditemukan, kembalikan nilai 0
        yield 0;
      }
    } catch (e) {
      // Jika terjadi kesalahan, tangani kesalahan
      print('Error: $e');
      yield 0;
    }
  }

  // Fungsi untuk memformat tanggal menjadi string (YYYY-MM-DD)
  String _formatTanggal(DateTime tanggal) {
    return '${tanggal.year}-${tanggal.month}-${tanggal.day}';
  }
}
