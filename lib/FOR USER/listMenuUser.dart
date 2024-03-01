import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Keranjang.dart';

class ListUser extends StatelessWidget {
  const ListUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x499c9c9c),
            offset: Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/esteh.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _buildTextInfo(),
              ],
            ),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Es Teh",
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
          Text("Rasa Taro",
              style:
                  GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500)),
          Text("Rp.8000",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    double iconSize =
        MediaQuery.of(context).size.width * 0.04; // Adjust the size as needed

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Keranjang(),
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(
            maxWidth: 40, maxHeight: 40, minWidth: 30, minHeight: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(73, 160, 19, 1),
        ),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
