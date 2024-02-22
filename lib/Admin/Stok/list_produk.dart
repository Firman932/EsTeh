import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/create_produk.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';

class ListProduk extends StatelessWidget {
  final bool isChecklistMode;
  final bool isChecked;
  final VoidCallback onToggleCheck;

  const ListProduk(
      {Key? key,
      required this.isChecklistMode,
      required this.isChecked,
      required this.onToggleCheck})
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
          builder: (context) => TambahProduk(),
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
                    width: 97,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/teh taro.jpg"),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Es Teh",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Rasa Taro",
                  style: GoogleFonts.poppins(
                      fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
          Text("Rp.8000",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text("Stok: 45",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
          if (isChecklistMode)
            Checkbox(
               
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              activeColor: Color.fromRGBO(73, 160, 19, 1),
              value: isChecked,
              onChanged: (value) {
                onToggleCheck();
              },
            ),
            SizedBox(height: 14),
          if (!isChecklistMode)
            _deleteActionButton(
                Icons.delete_outline_outlined, Colors.red, context),
          SizedBox(
            height: 10,
          )
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
            builder: (context) => DeleteDialog(),
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
}

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Kotak atas dengan logo peringatan
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Color.fromARGB(
                    255, 255, 174, 0), // Ganti warna sesuai keinginan
              ),
              child: Icon(
                Icons.warning,
                color: Colors.white,
                size: 70,
              ),
            ),
            SizedBox(height: 16), // Spasi antara kotak atas dan bawah
            // Kotak bawah dengan konfirmasi dan deskripsi peringatan
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 20, right: 20, bottom: 16),
              child: Column(
                children: [
                  Text("Peringatan",
                      style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 174, 0))),
                  SizedBox(height: 8),
                  Text(
                    "Apakah kamu yakin menghapus produk ini?",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Tombol untuk menutup dialog
                        },
                        child: Text(
                          "Batal",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tambahkan logika penghapusan item di sini
                          Navigator.of(context)
                              .pop(); // Tutup dialog setelah penghapusan berhasil
                        },
                        child: Text(
                          "Hapus",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
