import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuUser extends StatelessWidget {
  const MenuUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // group7083fxY (183:87)
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            // group7082o3A (183:90)
            padding: EdgeInsets.fromLTRB(17, 19.73, 17, 40),
            width: MediaQuery.of(context).size.width,
            height: 800.15,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupbeaqfLG (YaTXafxDvknZFYH9pubEaQ)
                  margin: EdgeInsets.all(17),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          // vector
                          //BpQ (183:137)
                          margin: EdgeInsets.fromLTRB(0, 0, 100, 0),
                          //left, top, right, buttom
                          width: 20,
                          child: Image.asset("assets/log.png")),

                      // Menambahkan jarak antara logo dan teks menu
                      Container(
                        margin: EdgeInsets.fromLTRB(38, 0, 0, 0),
                        // menuhGx (183:118)
                        //left, top, right, bottom

                        child: Text(
                          'Menu',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Expanded(
                          child:
                              SizedBox()), // Menambahkan jarak fleksibel antara teks menu dan ikon notifikasi
                      Container(
                        // autogroupb78qPQg (YaTXnkSS5HzYHQLxgob78Q)
                        width: 20,
                        child: Image.asset("assets/notif.png"),
                      ),
                      SizedBox(
                          width:
                              17), // Menambahkan jarak antara ikon notifikasi dan ikon keranjang
                      Container(
                        // vectorJXe (183:119)
                        width: 20,
                        child: Image.asset(
                          "assets/keranjang.png",
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupbqacDPi (YaTXuARQvdN6yC8amhbqaC)
                  margin: EdgeInsets.fromLTRB(7, 0, 6, 17),
                  padding: EdgeInsets.fromLTRB(13, 15.79, 219.5, 14.53),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x499c9c9c),
                        offset: Offset(0, 0),
                        blurRadius: 27.7000007629,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // vectorgYC (185:244)
                        margin: EdgeInsets.fromLTRB(0, 0, 15.5, 1.25),
                        width: 19,
                        height: 18.75,
                        child: Image.asset(
                          "assets/search.png",
                          width: 19,
                          height: 18.75,
                        ),
                      ),
                      Text(
                        // searchp8c (185:245)
                        'Search',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupz8jqACU (YaTY5f7vgSt7jDEh6Fz8JQ)
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 17),
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            // autogroupqsk6HXz (YaTYE53aLo24eui9LDQSK6)
                            margin: EdgeInsets.only(right: 10),

                            height: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xff55bc15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              // vectoromE (179:171)
                              child: SizedBox(
                                width: 20,
                                height: 21,
                                child: Image.asset(
                                  "assets/menu1.png",
                                  color: Colors.white,
                                  width: 14,
                                  height: 19.71,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // autogroup5cp4LmA (YaTYH9nmqmnKcBgiVM5Cp4)
                            // padding:
                            //     EdgeInsets.fromLTRB(65.25, 5.19, 66.25, 5.92),
                            margin: EdgeInsets.only(left: 10),
                            height: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x499c9c9c),
                                  offset: Offset(0, 0),
                                  blurRadius: 27.7000007629,
                                ),
                              ],
                            ),
                            child: Center(
                              // phbowlfoodfillFdE (179:292)
                              child: SizedBox(
                                width: 22,
                                height: 22,
                                child: Image.asset(
                                  "assets/menu2.png",
                                  width: 22,
                                  height: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // autogroupelquBmn (YaTYPebwyZmZtPRAVneLQU)
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6.91),
                  padding: EdgeInsets.fromLTRB(17, 14.8, 19, 18.75),
                  width: MediaQuery.of(context).size.width,
                  height: 116,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x499c9c9c),
                        offset: Offset(0, 0),
                        blurRadius: 27.7000007629,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // 4Kn (183:102)
                        margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                        width: 97,
                        height: 80.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/keranjang.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        // autogroup7q6laov (YaTYZZV6kAyoVWuVMY7q6L)
                        margin: EdgeInsets.fromLTRB(0, 2.96, 79, 8.64),
                        width: 64,
                        height: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupvpnkv76 (YaTYdeCdef8FZkDybCVPNk)
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 6.71),
                              width: MediaQuery.of(context).size.width,
                              height: 44.6,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // estehFv4 (183:103)
                                    left: 0,
                                    top: 0,
                                    child: Align(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 30,
                                        child: Text(
                                          'Es Teh',
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // rasataroy5N (183:104)
                                    left: 2,
                                    top: 29.5985412598,
                                    child: Align(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 15,
                                        child: Text(
                                          'Rasa Taro',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // rp80004sW (183:105)
                              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Rp. 8.000',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group7075QAg (183:116)
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 37,
                        height: 37,
                        child: Image.asset(
                          "assets/buttonkeranjang.png",
                          width: 37,
                          height: 37,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
