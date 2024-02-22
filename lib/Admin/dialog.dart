import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          // Tambahkan logika penghapusan item di sini
                          Navigator.of(context)
                              .pop(); // Tutup dialog setelah penghapusan berhasil
                        },
                        child: Text(
                          "Ok",
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
