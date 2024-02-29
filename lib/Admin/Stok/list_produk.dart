import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/create_produk.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';
import 'package:lji/Admin/Update/update.dart';

import '../../styles/dialog.dart';

class ListProduk extends StatelessWidget {
  final bool isChecklistMode;
  final bool isChecked;
  final VoidCallback onToggleCheck;
  final DocumentSnapshot produkData;

  const ListProduk(
      {Key? key,
      required this.isChecklistMode,
      required this.isChecked,
      required this.onToggleCheck,
      required this.produkData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isChecklistMode) {
          onToggleCheck();
        } else {
          // Navigate to another page or perform an action
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateProduk(
                namaProduk: produkData['nama_produk'],
                hargaProduk: '',
                stokProduk: produkData['stok_produk'].toString(),
                gambarUrl: produkData['gambar_produk'],
                varianProduk: produkData['variasi_rasa'],
                documentId: produkData.id,
                kategoriProduk: produkData['kategori_produk'],
              ),
            ),
          );
        }
      },
      onLongPress: () {
        if (!isChecklistMode) {
          // Aktifkan mode checklist di StokProduk
          StokProduk.of(context).activateChecklistMode();
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 116,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(156, 156, 156, 0.29),
              offset: Offset(0, 0),
              blurRadius: 55.5,
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
              Row(
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
              _buildActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(produkData['nama_produk'],
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            Text(produkData['variasi_rasa'],
                style: GoogleFonts.poppins(
                    fontSize: 11, fontWeight: FontWeight.w500)),
          ],
        ),
        Text("Rp.8000",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13)),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Stok: " + produkData['stok_produk'].toString(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12)),
          ),
          if (isChecklistMode)
            Checkbox(
              visualDensity: VisualDensity.standard,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeColor: Color.fromRGBO(73, 160, 19, 1),
              value: isChecked,
              onChanged: (value) {
                onToggleCheck();
              },
            ),
          SizedBox(height: 15),
          if (!isChecklistMode)
            _deleteActionButton(
                Icons.delete_outline_outlined, Colors.red, context,produkData.id),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _deleteActionButton(IconData icon, Color color, BuildContext context,String documentId) {
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
              onButtonConfirm: () async {
                Navigator.pop(context);
                await deleteProduct(documentId);
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
      ),
    );
  }

  Future<void> deleteProduct(String documentId) async {
    try {
      // Ambil referensi dokumen produk dari Firestore
      final CollectionReference produkCollection =
          FirebaseFirestore.instance.collection('produk');

      // Hapus dokumen berdasarkan ID
      await produkCollection.doc(documentId).delete();

      // Tampilkan pesan sukses atau lakukan tindakan lain
      print('Produk berhasil dihapus');
    } catch (error) {
      // Tampilkan pesan atau lakukan penanganan kesalahan sesuai kebutuhan
      print('Error deleting product: $error');
    }
  }
}
