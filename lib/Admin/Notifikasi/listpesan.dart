import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListPesan extends StatelessWidget {
  final Map<String, dynamic> produk;
  const ListPesan({
    Key? key,
    required this.produk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gambarProduk = produk['gambar_produk'];
    String namaProduk = produk['nama_produk'];
    String variasiRasa = produk['variasi_rasa'];
    int hargaProduk = produk['harga_produk'];
    int jumlah = produk['jumlah'];
    int totalHarga = produk['total_harga'];
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(156, 156, 156, 0.28999999165534972),
                offset: Offset(0, 0),
                blurRadius: 5)
          ]),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(gambarProduk),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      namaProduk,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      variasiRasa,
                      style: GoogleFonts.poppins(fontSize: 8),
                    ),
                    Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(hargaProduk),
                        style: GoogleFonts.poppins(
                            fontSize: 9, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("$jumlah/pcs",
                  style: GoogleFonts.poppins(
                      fontSize: 10, fontWeight: FontWeight.w400)),
            ],
          ),
          Row(
            children: [
              Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(totalHarga),
                  style: GoogleFonts.poppins(
                      fontSize: 10, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}
