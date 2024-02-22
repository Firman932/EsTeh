import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
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
                        // group70856E9 (137:433)
                        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                        width: 50,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(73, 160, 19, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                "assets/notif.png",
                                width: 15,
                                height: 15,
                                color: Color.fromRGBO(73, 160, 19, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupvanqPyw (SQGEMhfqY9fbFY921aVanq)
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 110,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // autogroup4ipfWof (SQGEUCV1fweqXjsU224iPF)
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // pesanSxD (86:171)
                                    margin: EdgeInsets.only(
                                        right: 10), // Mengubah margin right
                                    child: Text(
                                      'Pesan',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  Spacer(), // Spacer untuk memisahkan teks dari tanggal dan waktu
                                  Column(
                                    children: [
                                      Row(
                                        // Mengubah alignment ke start
                                        children: [
                                          Text(
                                            '12-02-2024',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          Text(
                                            '09.02 WIB',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // kamutelahcheckoutpesananmutung (86:175)

                              child: Text(
                                'Kamu telah checkout pesananmu, tunggu konfirmasi dari admin dulu ya.....!!!!!!!',
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
                    ],
                  ),
                ),
              ])),
        ));
  }
}
