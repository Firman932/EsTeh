import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/NotifUser/CustomReqNotif.dart';
import 'package:lji/NotifUser/CustomDelNotif.dart';

class NotifUser extends StatefulWidget {
  const NotifUser({Key? key});

  @override
  State<NotifUser> createState() => _NotifUserState();
}

class _NotifUserState extends State<NotifUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifikasi',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            height: 3,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: 10, // Jumlah item dalam daftar
          itemBuilder: (BuildContext context, int index) {
            // Pembangunan item berdasarkan indeks
            if (index % 2 == 0) {
              // Menampilkan NotifReq untuk indeks genap
              return NotifReq();
            } else if (index == 1 || index == 3) {
              // Menampilkan NotifDel untuk indeks 1 dan 3
              return NotifDel();
            }
          },
        ),
      ),
    );
  }
}
