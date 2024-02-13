import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi Radit",
                            style: GoogleFonts.inter(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("Kamu adalah admin",
                            style: GoogleFonts.inter(
                                fontSize: 11, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.history,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.notifications,
                          size: 25,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    156, 156, 156, 0.28999999165534973),
                                offset: Offset(0, 0),
                                blurRadius: 55.5)
                          ]),
                          width: 120,
                          height: 126,
                          child: Stack(children: <Widget>[
                            Container(
                                width: 120,
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ),
                                )),
                            Container(
                              width: 120,
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
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ])),
                      Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    156, 156, 156, 0.28999999165534973),
                                offset: Offset(0, 0),
                                blurRadius: 55.5)
                          ]),
                          width: 120,
                          height: 126,
                          child: Stack(children: <Widget>[
                            Container(
                              width: 120,
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
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
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(
                                156, 156, 156, 0.28999999165534973),
                            offset: Offset(0, 0),
                            blurRadius: 55.5)
                      ] // Ganti warna sesuai kebutuhan
                      ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Produk",
                      style: GoogleFonts.inter(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Tambahkan produk",
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      156, 156, 156, 0.28999999165534973),
                                  offset: Offset(0, 0),
                                  blurRadius: 55.5)
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(73, 160, 19, 1)),
                        child: Image.asset("assets/minum.png")),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      156, 156, 156, 0.28999999165534973),
                                  offset: Offset(0, 0),
                                  blurRadius: 55.5)
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Image.asset("assets/makan.png")),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      156, 156, 156, 0.28999999165534973),
                                  offset: Offset(0, 0),
                                  blurRadius: 55.5)
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Image.asset("assets/stok.png")),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 116,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(
                                156, 156, 156, 0.28999999165534973),
                            offset: Offset(0, 0),
                            blurRadius: 55.5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                                  image: AssetImage(
                                    "assets/teh taro.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Es Teh",
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text("Rasa Taro",
                                  style: GoogleFonts.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600)),
                              Text(
                                "Rp.8000",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Stok: 45",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 27,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red,
                                      ),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      )),
                                  SizedBox(width: 10),
                                  Container(
                                      height: 27,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(73, 160, 19, 1),
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 116,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(
                                  156, 156, 156, 0.28999999165534973),
                              offset: Offset(0, 0),
                              blurRadius: 55.5)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
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
                                    image: AssetImage(
                                      "assets/teh taro.jpg",
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Es Teh",
                                    style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("Rasa Taro",
                                    style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  "Rp.8000",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Stok: 45",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        height: 27,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red,
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )),
                                    SizedBox(width: 10),
                                    Container(
                                        height: 27,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color.fromRGBO(73, 160, 19, 1),
                                        ),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 116,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(
                                  156, 156, 156, 0.28999999165534973),
                              offset: Offset(0, 0),
                              blurRadius: 55.5)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
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
                                    image: AssetImage(
                                      "assets/teh taro.jpg",
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Es Teh",
                                    style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("Rasa Taro",
                                    style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  "Rp.8000",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Stok: 45",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        height: 27,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red,
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )),
                                    SizedBox(width: 10),
                                    Container(
                                        height: 27,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color.fromRGBO(73, 160, 19, 1),
                                        ),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
