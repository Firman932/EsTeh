import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Keranjang.dart';
import 'package:lji/tampilan%20keranjang.dart';

class MenuUser extends StatelessWidget {
  const MenuUser({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        leading: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
            left: 10 + MediaQuery.of(context).padding.left,
          ),
          child: Image.asset(
            "assets/log.png",
            width: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/notif.png",
              width: 24,
            ),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: Image.asset(
                "assets/keranjang.png",
                width: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeranjangPage()),
                );
                // Handle cart icon press
              },
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
            Expanded(
              child: ListView.builder(
                itemCount: 200, // specify your itemCount
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(27, 8, 27, 8),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
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
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 17),
                              margin: EdgeInsets.only(
                                right:
                                    120 + MediaQuery.of(context).padding.right,
                              ),
                              width: 100,
                              height: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 6.71),
                                    width: MediaQuery.of(context).size.width,
                                    height: 44.6,
                                    child: Column(
                                      children: [
                                        Positioned(
                                          child: Align(
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                          left: 2,
                                          top: 29.5985412598,
                                          child: Align(
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 12,
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
                                    padding: EdgeInsets.fromLTRB(0, 2, 1, 0),
                                    // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                            InkWell(
                              onTap: () {
                                // Navigate to the "Keranjang" screen when tapped.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Keranjang()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
