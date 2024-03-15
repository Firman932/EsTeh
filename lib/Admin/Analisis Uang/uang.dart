import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Analisis%20Uang/listpendapatan.dart';
import '../History/history.dart';
import '../Notifikasi/notifikasi.dart';

class Pendapatan extends StatefulWidget {
  const Pendapatan({Key? key}) : super(key: key);

  @override
  _PendapatanState createState() => _PendapatanState();
}

class _PendapatanState extends State<Pendapatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          // Your existing widgets inside the Column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("Total minggu ini",
                    style: GoogleFonts.poppins(fontSize: 12)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Rp 500.000",
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 80,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Terbaru",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 20,
                ),
                ListPendapatan(),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Minggu yang lalu",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListPendapatan();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
