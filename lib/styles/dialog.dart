import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/styles/button.dart';
import 'package:lji/styles/color.dart';
import 'package:lji/styles/font.dart';

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
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 174, 0))),
                  SizedBox(height: 8),
                  Text(
                    "Apakah kamu yakin menghapus produk ini?",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Batal",
                            style: textdialog,
                          ),
                          style: greenButton),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Hapus",
                          style: textdialog,
                        ),
                        style: redButton,
                      )
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

class SucessDialog extends StatelessWidget {
  const SucessDialog({super.key});

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
                color: Color.fromRGBO(
                    73, 160, 19, 1), // Ganti warna sesuai keinginan
              ),
              child: Icon(
                Icons.check,
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
                  Text("Berhasil",
                      style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: greenPrimary)),
                  SizedBox(height: 8),
                  Text(
                    "Berhasil menambahkan stok",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Ok",
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Colors.white),
                          ),
                          style: greenButton)
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
