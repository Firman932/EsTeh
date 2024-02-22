import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Analisis extends StatelessWidget {
  const Analisis({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      156, 156, 156, 0.28999999165534972),
                                  offset: Offset(0, 0),
                                  blurRadius: 55.5)
                            ]),
                            height: 126,
                            child: Stack(children: <Widget>[
                              Container(
                                  height: 126,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("Rp 1.349.324.439",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ),
                                  )),
                              Container(
                                width: double.infinity,
                                height: 77,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: Color.fromRGBO(73, 160, 19, 1),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/uang.png"),
                                      Text(
                                        "Uang",
                                        style: GoogleFonts.poppins(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ])),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      156, 156, 156, 0.28999999165534973),
                                  offset: Offset(0, 0),
                                  blurRadius: 55.5)
                            ]),
                            height: 126,
                            child: Stack(children: <Widget>[
                              Container(
                                height: 126,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "30",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 77,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: Color.fromRGBO(73, 160, 19, 1),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/produk.png"),
                                      Text(
                                        "Total Produk",
                                        style: GoogleFonts.poppins(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ])),
                      )
                    ],
                  ),
                );
  }
}