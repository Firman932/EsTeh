import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Keranjang.dart';

class ListUser extends StatelessWidget {
  const ListUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 116,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(156, 156, 156, 0.29),
            offset: Offset(0, 0),
            blurRadius: 55.5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 97,
              height: 82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/esteh.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildTextInfo(),
            SizedBox(width: 25),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Es Teh",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("Rasa Taro",
              style:
                  GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600)),
          Text("Rp.8000", style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.center,
        children:[ 
          Container(height: 37,width: 37,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(73, 160, 19, 1),
          ),),
          IconButton(onPressed: () {
          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Keranjang(),
                                  ),
                                );
        }, icon: Icon(Icons.shopping_cart,color: Colors.white,)),
        ]
      ),
    );
  }
}
