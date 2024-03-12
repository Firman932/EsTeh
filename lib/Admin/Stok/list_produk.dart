import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lji/Admin/Create/create_produk.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';
import 'package:lji/Admin/Update/update.dart';

import '../../styles/dialog.dart';

class ListProduk extends StatefulWidget {
  final bool isChecklistMode;
  final bool isChecked;
  final VoidCallback onToggleCheck;
  final DocumentSnapshot produkData;

  const ListProduk({
    Key? key,
    required this.isChecklistMode,
    required this.isChecked,
    required this.onToggleCheck,
    required this.produkData,
  }) : super(key: key);

  @override
  _ListProdukState createState() => _ListProdukState();
}

class _ListProdukState extends State<ListProduk> {
  bool _deleteSuccess = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isChecklistMode) {
          widget.onToggleCheck();
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateProduk(
                namaProduk: widget.produkData['nama_produk'],
                hargaProduk: widget.produkData['harga_produk'].toString(),
                stokProduk: widget.produkData['stok_produk'].toString(),
                gambarUrl: widget.produkData['gambar_produk'],
                varianProduk: widget.produkData['variasi_rasa'],
                documentId: widget.produkData.id,
                kategoriProduk: widget.produkData['kategori_produk'],
              ),
            ),
          );
        }
      },
      onLongPress: () {
        if (!widget.isChecklistMode) {
          StokProduk.of(context).activateChecklistMode();
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(vertical: 10),
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
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image:
                              NetworkImage(widget.produkData['gambar_produk']),
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
              Text(widget.produkData['nama_produk'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Text(widget.produkData['variasi_rasa'],
                  style: GoogleFonts.poppins(
                      fontSize: 11, fontWeight: FontWeight.w500)),
            ],
          ),
          Text(
              NumberFormat.currency(
                      locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                  .format(widget.produkData['harga_produk']),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Stok: ${widget.produkData['stok_produk']}",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12)),
          ),
          if (widget.isChecklistMode)
            Checkbox(
              visualDensity: VisualDensity.standard,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeColor: Color.fromRGBO(73, 160, 19, 1),
              value: widget.isChecked,
              onChanged: (value) {
                widget.onToggleCheck();
              },
            ),
          SizedBox(height: 15),
          if (!widget.isChecklistMode)
            _deleteActionButton(Icons.delete_outline_outlined, Colors.red,
                context, widget.produkData.id),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _deleteActionButton(
      IconData icon, Color color, BuildContext context, String documentId) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: IconButton(
        onPressed: () async {
          await showDialog(
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
                final String documentId = widget.produkData.id;
                await deleteProduct(documentId, context);
                setState(() {
                  _deleteSuccess = true;
                });
                Navigator.pop(context);
              },
            ),
          );
          if (_deleteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Produk berhasil dihapus'),
                duration: Duration(seconds: 3),
              ),
            );
          }
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

  Future<void> deleteProduct(String documentId, BuildContext context) async {
    try {
      final CollectionReference produkCollection =
          FirebaseFirestore.instance.collection('produk');

      await produkCollection.doc(documentId).delete();
      print('Produk berhasil dihapus');
    } catch (error) {
      print('Error deleting product: $error');
      showDialog(
        context: context,
        builder: (context) => WarningDialog(
          title: "Error",
          content: "Terjadi kesalahan saat menghapus produk",
          buttonConfirm: "Ok",
          onButtonConfirm: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }
}
