import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../History/history.dart';
import '../Notifikasi/notifikasi.dart';

class Pendapatan extends StatelessWidget {
  const Pendapatan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Riwayat(),
                  ),
                );
              },
              child: Icon(
                Icons.history,
                size: 25,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifikasi(),
                  ),
                );
              },
              child: Icon(
                Icons.notifications,
                size: 25,
              ),
            ),
            SizedBox(
              width: 13,
            )
          ],
          centerTitle: true,
          title: Text(
            "Pendapatan",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.all(10),
          child: Column(
            children: [Text("Total minggu ini")],
          ),
        ),
      ),
    );
  }
}
