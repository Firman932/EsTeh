import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Notifikasi/listpesan.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Notifikasi",
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromRGBO(156, 156, 156, 0.28999999165534972),
                        offset: Offset(0, 0),
                        blurRadius: 55.5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.circle_notifications_rounded,
                                  color: Color.fromARGB(255, 73, 160, 19),
                                ),
                                SizedBox(width: 2),
                                Expanded(
                                  child: Text(
                                    "Dari Maulana Ilham Sudrajat",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                          ),
                          Text(
                            "12 Jan 2024",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apakah kamu mau menerima pesanan dari user yang mau membeli produk kamu ?",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "List Pesanan: ",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7.5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 15),
                                    Text(
                                      "Total :",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "8/pcs",
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                    Text(
                                      "Rp.88.000",
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (status.isEmpty)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        status = 'Pesanan ditolak';
                                      });
                                    },
                                    child: Text(
                                      "Tolak",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                SizedBox(width: 10),
                                if (status.isEmpty)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        status = 'Pesanan diterima';
                                      });
                                    },
                                    child: Text(
                                      "Terima",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 73, 160, 19),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            if (status.isNotEmpty)
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  status,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: status == 'Pesanan ditolak'
                                        ? Colors.red
                                        : Color.fromARGB(255, 73, 160, 19),
                                  ),
                                ),
                              )
                            else
                              SizedBox.shrink(),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
