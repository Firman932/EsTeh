import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lji/Keranjang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListUser extends StatelessWidget {
  final DocumentSnapshot produkData;
  const ListUser({super.key, required this.produkData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 116,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(156, 156, 156, 0.29),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(produkData['gambar_produk']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  _buildTextInfo(),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(produkData['nama_produk'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Text(produkData['variasi_rasa'],
                  style: GoogleFonts.poppins(
                      fontSize: 11, fontWeight: FontWeight.w500)),
            ],
          ),
          Text(
            NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                .format(produkData['harga_produk']),
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.04;

    // Periksa apakah stok produk kosong
    bool stockEmpty = produkData['stok_produk'] == 0;

    // Jika stok kosong, tampilkan teks 'Habis' dan nonaktifkan tombol
    if (stockEmpty) {
      return Center(
        child: Text(
          'Stock Habis',
          style: GoogleFonts.poppins(
            color: Colors.red,
            fontSize: 14,
          ),
        ),
      );
    } else {
      // Jika stok tersedia, tampilkan tombol keranjang
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Keranjang(
                produkData: produkData,
              ),
            ),
          );
        },
        child: Container(
          constraints: BoxConstraints(
              maxWidth: 40, maxHeight: 40, minWidth: 30, minHeight: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromRGBO(
                73, 160, 19, 1), // Warna hijau untuk tombol keranjang
          ),
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: iconSize,
          ),
        ),
      );
    }
  }
}
