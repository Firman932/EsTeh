import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/create_produk.dart';
import 'package:lji/Admin/Dashboard/analisis.dart';
import 'package:lji/Admin/Dashboard/filter.dart';
import 'package:lji/Admin/Dashboard/header.dart';
import 'package:lji/Admin/Dashboard/list_menu.dart';
import 'package:lji/Admin/Dashboard/search.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';
// Sesuaikan dengan lokasi file Product.dart
// Sesuaikan dengan lokasi file api_service.dart

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Stream<QuerySnapshot> produkStream;

  @override
  void initState() {
    super
        .initState(); // Panggil fungsi untuk mengambil data produk saat widget diinisialisasi
    produkStream = FirebaseFirestore.instance.collection('produk').snapshots();
  }

  // Fungsi untuk mengambil data produk dari backend

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
            PreferredSize(preferredSize: Size.fromHeight(70), child: Header()),
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
                FilterAdmin(),
                // Tampilkan data produk dalam daftar
                StreamBuilder<QuerySnapshot>(
                  stream: produkStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    // Extract product data from the snapshot
                    final List<DocumentSnapshot> produkList =
                        snapshot.data!.docs.toList();

                    if (produkList.isEmpty) {
                      return Text('Tidak ada produk.');
                    }

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
