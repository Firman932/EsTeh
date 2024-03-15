import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(gambarProduk), fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaProduk,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          variasiRasa,
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(hargaProduk),
                            style: GoogleFonts.poppins(
                                fontSize: 9, fontWeight: FontWeight.w500)),
                        Text("$jumlah/pcs",
                            style: GoogleFonts.poppins(
                                fontSize: 9, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
