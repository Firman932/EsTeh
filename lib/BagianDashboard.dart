import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Keranjang.dart';
import 'package:lji/TampilanUserKeranjang.dart';
import 'package:lji/login01.dart';

class MenuUser extends StatelessWidget {
  const MenuUser({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Menu',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              height: 3,
              color: Color(0xff000000),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            // Tambahkan fungsi yang ingin dijalankan saat ikon leading ditekan
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              left: 10 + MediaQuery.of(context).padding.left,
            ),
            child: Image.asset(
              "assets/log.png",
              width: 24,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/notif.png",
                width: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeranjangPage02()),
                );
                // Handle cart icon press
              },
              child: Image.asset(
                "assets/keranjang.png",
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(17, 19.73, 17, 40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 19),
              padding: EdgeInsets.fromLTRB(13, 15, 13, 15),
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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 17),
              width: MediaQuery.of(context).size.width,
              height: 38,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xff55bc15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Container(
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
                          child: Container(
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20, // specify your itemCount
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          
                          Container(
                            margin: EdgeInsets.,
                            width: 97,
                            height: 80.9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/esteh.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
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
                                Container(
                                  height: 20,
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
                                Text(
                                  'Rp. 8.000',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigate to the "Keranjang" screen when tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Keranjang(),
                                ),
                              );
                            },
                            child: Container(
                              width: 33,
                              height: 33,
                              child: Image.asset(
                                "assets/buttonkeranjang.png",
                                width: 33,
                                height: 33,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
