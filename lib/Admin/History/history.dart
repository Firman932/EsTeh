import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Notifikasi/listpesan.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text(
            "Riwayat",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(
                                156, 156, 156, 0.28999999165534972),
                            offset: Offset(0, 0),
                            blurRadius: 5),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Color.fromARGB(255, 73, 160, 19),
                                ),
                              ),
                              Icon(
                                Icons.history,
                                size: 19,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "List Pesanan Maulana Ilham",
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ListPesan(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child: Text("Total :",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("8/pcs",
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Rp.88.000",
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 15, top: 15),
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              "Pesan DIterima",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 73, 160, 19),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "12-02-2024",
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "09:15 WIB",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
