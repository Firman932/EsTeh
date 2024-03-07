import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Keranjang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListUser extends StatelessWidget {
  final DocumentSnapshot produkData;
  const ListUser({super.key, required this.produkData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsetsDirectional.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0x499c9c9c),
                offset: Offset(0, 0),
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(produkData['gambar_produk']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      _buildTextInfo(),
                    ],
                  ),
                ),
                _buildActions(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextInfo() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              produkData["nama_produk"],
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              produkData["variasi_rasa"],
              style:
                  GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Rp ${produkData['harga_produk']}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    double iconSize =
        MediaQuery.of(context).size.width * 0.04; // Adjust the size as needed

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
          color: Color.fromRGBO(73, 160, 19, 1),
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
