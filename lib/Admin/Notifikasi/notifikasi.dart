import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lji/Admin/Notifikasi/listpesan.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({
    Key? key,
  }) : super(key: key);

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  late List<DocumentSnapshot> pesananList = [];
  String status = '';

  @override
  void initState() {
    super.initState();
    // Lakukan pengambilan data pesanan dari Firestore di sini
    fetchDataPesanan();
  }

  void fetchDataPesanan() {
    // Lakukan pengambilan data pesanan dari Firestore dan simpan ke dalam pesananList
    // Misalnya:
    FirebaseFirestore.instance
        .collection('pesanan')
        .get()
        .then((querySnapshot) {
      setState(() {
        pesananList = querySnapshot.docs;
      });
    }).catchError((error) {
      print("Error fetching pesanan: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
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
        itemCount: pesananList.length,
        itemBuilder: (context, index) {
          DocumentSnapshot pesanan = pesananList[index];
          String namaPembeli = pesanan['nama_pembeli'];
          String tanggal = pesanan['tanggal'];
          String jam = pesanan['jam'];
          int totalHarga = pesanan['harga_total'];
          int totalBarang = pesanan['total_barang'];
          List<dynamic> produkList = pesanan['produk'];
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
                        blurRadius: 3,
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
                                    "Dari $namaPembeli",
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
                            tanggal,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apakah kamu mau menerima pesanan dari user yang mau membeli produk kamu ?",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "List Pesanan: ",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: produkList.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => ListPesan(
                                    produk: produkList[index],
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Total : ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format(totalHarga),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (status.isEmpty)
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('pesanan')
                                          .doc(pesanan.id)
                                          .update({
                                        'status': 'Ditolak',
                                      });
                                      setState(() {
                                        status = 'Pesanan ditolak';
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      minimumSize: Size(0, 40),
                                      shape: RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "Tolak",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                SizedBox(width: 10),
                                if (status.isEmpty)
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('pesanan')
                                          .doc(pesanan.id)
                                          .update({
                                        'status': 'Diterima',
                                      });
                                      setState(() {
                                        status = 'Pesanan diterima';
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 73, 160, 19),
                                      minimumSize: Size(0, 40),
                                      shape: RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "Terima",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
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
                            SizedBox(height: 15),
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
