import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPesan extends StatelessWidget {
  const ListPesan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/teh taro.jpg"))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Es Teh",
                  style: GoogleFonts.poppins(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rasa Taro",
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
                Text("Rp.8.000", style: GoogleFonts.poppins(fontSize: 10))
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("2/pcs", style: GoogleFonts.poppins(fontSize: 10)),
            SizedBox(
              width: 15,
            ),
            Text("Rp.16.000", style: GoogleFonts.poppins(fontSize: 10))
          ],
        ),
      ),
    );
  }
}
