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
  // List untuk menyimpan data produk

  @override
  void initState() {
    super
        .initState(); // Panggil fungsi untuk mengambil data produk saat widget diinisialisasi
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
                Filter(),
                // Tampilkan data produk dalam daftar
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListMenu();
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
