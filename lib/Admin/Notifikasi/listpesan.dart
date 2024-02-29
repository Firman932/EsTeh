import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPesan extends StatefulWidget {
  const ListPesan({Key? key}) : super(key: key);

  @override
  _ListPesanState createState() => _ListPesanState();
}

class _ListPesanState extends State<ListPesan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(156, 156, 156, 0.28999999165534972),
                offset: Offset(0, 0),
                blurRadius: 5)
          ]),
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/teh taro.jpg"),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Es Teh",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Rasa Taro",
                          style: GoogleFonts.poppins(fontSize: 8),
                        ),
                        Text("Rp.8.000",
                            style: GoogleFonts.poppins(
                                fontSize: 9, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("2/pcs",
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                Text("Rp.16.000",
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
