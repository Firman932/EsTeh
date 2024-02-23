import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Keranjang extends StatefulWidget {
  Keranjang({Key? key}) : super(key: key);

  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  TextEditingController _controller = TextEditingController();
  int _nol = 0; // Angka awal dan nilai awal uang
  int _pricePerUnit = 8000; // Harga per unit
  bool _isMaxReached = false; // Penanda jika nilai maksimum telah tercapai

  @override
  void initState() {
    super.initState();
    _controller.text = '$_nol'; // Set nilai awal teks
  }

  void _updateTotalPrice() {
    setState(() {
      _nol = int.tryParse(_controller.text) ?? 0;
      if (_nol > 100) {
        _nol = 100;
        _controller.text = '$_nol';
        _isMaxReached = true;
      } else {
        _isMaxReached = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 28, 30, 82),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context)
                          .size
                          .width, // Sesuaikan tinggi dengan lebar untuk membuat gambar persegi
                      child: AspectRatio(
                        aspectRatio:
                            1, // Memastikan gambar tetap berbentuk persegi
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/esteh.png",
                            fit: BoxFit
                                .cover, // Mengatur bagaimana gambar ditampilkan
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 26),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 3),
                        child: Text(
                          'Es Teh',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff030303),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            left: 2 + MediaQuery.of(context).padding.left),
                        child: Text(
                          'Rasa Taro',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 800,
                  height: 49,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, //ubah menjadi MainAxisAlignment.spaceBetween
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rp ${_nol * _pricePerUnit >= 0 ? _nol * _pricePerUnit : 0}', // Ubah teks default menjadi 'Rp ${_nol * _pricePerUnit}'
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: _isMaxReached
                              ? Colors
                                  .grey // Ubah warna teks saat batas maksimum tercapai
                              : Color(0xff49a013),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset(
                              "assets/minus.png",
                              width: 28,
                            ),
                            onPressed: () {
                              if (_nol > 0) {
                                setState(() {
                                  _nol--;
                                  _controller.text = '$_nol';
                                  _updateTotalPrice();
                                });
                              }
                            },
                          ),
                          SizedBox(width: 5),
                          IntrinsicWidth(
                            // Ubah lebar TextField sesuai kebutuhan Anda
                            child: TextField(
                              autofocus: false,
                              controller: _controller,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                if (int.tryParse(value) != null) {
                                  _updateTotalPrice();
                                }
                              },
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              enabled:
                                  !_isMaxReached, // Nonaktifkan TextField jika batas maksimum tercapai
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.zero, // Hapus padding bawaan
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: Image.asset(
                              "assets/plus.png",
                              width: 28,
                            ),
                            onPressed: () {
                              if (!_isMaxReached) {
                                setState(() {
                                  _nol++;
                                  _controller.text = '$_nol';
                                  _updateTotalPrice();
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    // Tambahkan logika navigasi ke layar berikutnya di sini
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        // Menggunakan 10% lebar layar sebagai margin horizontal
                        vertical: 30 +
                            MediaQuery.of(context)
                                .padding
                                .vertical, // Menggunakan 10% tinggi layar sebagai margin vertikal
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xff4fb60e),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Masukkan Keranjang',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
