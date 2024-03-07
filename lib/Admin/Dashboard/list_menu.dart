import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lji/Admin/Update/update.dart';

import '../../styles/dialog.dart';

class ListMenu extends StatelessWidget {
  final DocumentSnapshot produkData;
  const ListMenu({super.key, required this.produkData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProduk(
              namaProduk: produkData['nama_produk'],
              hargaProduk: produkData['harga_produk'].toString(),
              stokProduk: produkData['stok_produk'].toString(),
              gambarUrl: produkData['gambar_produk'],
              varianProduk: produkData['variasi_rasa'],
              documentId: produkData.id,
              kategoriProduk: produkData['kategori_produk'],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: 116,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(156, 156, 156, 0.29),
              offset: Offset(0, 0),
              blurRadius: 5,
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
              _buildActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produkData['nama_produk'],
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    produkData['variasi_rasa'],
                    style: GoogleFonts.poppins(
                        fontSize: 11, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Text(
              "Rp ${produkData['harga_produk']}",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 13),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Stok: ${produkData['stok_produk']}",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _deleteActionButton(IconData icon, Color color, BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => DeleteDialog(
              title: 'Peringatan',
              content: 'Apakah anda yakin menghapus produk ini?',
              buttonCancel: 'Batal',
              onButtonCancel: () {
                Navigator.pop(context);
              },
              buttonConfirm: 'Hapus',
              onButtonConfirm: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        iconSize: 20,
        padding: EdgeInsets.zero,
        splashRadius: 24,
      ),
    );
  }

  Widget _updateActionButton(IconData icon, Color color) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        iconSize: 20,
        padding: EdgeInsets.zero,
        splashRadius: 24,
      ),
    );
  }
}
