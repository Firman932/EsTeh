import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => KeranjangPage01();
}

class KeranjangPage01 extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        // keranjanghapuskeranjangzCV (86:626)
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              // keranjanggb7 (86:539)
              left: 0,
              top: 0,
              child: Container(
                width: 360,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupkvjzBnm (3HNL2o3fLQzUaeUZXvkvJZ)
                      padding: EdgeInsets.fromLTRB(17, 27, 9, 94),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupyjhbtSH (3HNHnSdCEGB92Y7TmPYJhB)
                            margin: EdgeInsets.fromLTRB(8, 0, 0, 38),
                            padding: EdgeInsets.fromLTRB(0, 0, 101, 0),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // vectorAeh (I86:539;83:27)
                                  margin: EdgeInsets.fromLTRB(0, 0, 64, 1),
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    "assets/esteh.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                RichText(
                                  // keranjang4sJD (I86:539;83:26)
                                  text: TextSpan(
                                    style: GoogleFonts.poppins(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Color(0xff000000),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Keranjang',
                                        style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '(4)',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroup6apoZ4Z (3HNHzbwbfFzoep86Yq6aPo)
                            margin: EdgeInsets.fromLTRB(13, 0, 237, 12),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // rectangle5764sqw (I86:539;86:526)
                                  margin: EdgeInsets.fromLTRB(0, 0, 11, 2),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Color(0xff000000)),
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  // semuakeq (I86:539;86:527)
                                  'Semua',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupyuk5hpy (3HNJ9mLzsjftvE6z6gYUk5)
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 14),
                            padding: EdgeInsets.fromLTRB(13, 15, 22.5, 19),
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
                                  // rectangle57659gy (I86:539;119:490)
                                  margin: EdgeInsets.fromLTRB(0, 4, 11, 0),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Color(0xff000000)),
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Container(
                                  // H2V (I86:539;83:29)
                                  margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                                  width: 97,
                                  height: 82,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/esteh.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogrouppxffzhb (3HNJLvh4uE7NRYmhobPxfF)
                                  margin: EdgeInsets.fromLTRB(0, 3, 28, 9),
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // esteh6kd (I86:539;83:30)
                                        'Es Teh',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Container(
                                        // rasatarodEm (I86:539;83:31)
                                        margin: EdgeInsets.fromLTRB(2, 0, 0, 7),
                                        child: Text(
                                          'Rasa Leci',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // rp8000MRf (I86:539;83:32)
                                        margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
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
                                  // jumlahbarangUWH (I86:539;131:363)
                                  margin: EdgeInsets.fromLTRB(0, 34, 0, 27),
                                  height: MediaQuery.of(context).size.width,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // vectorQuj (I86:539;131:367)
                                        margin: EdgeInsets.fromLTRB(
                                            0, 0, 6.75, 0.75),
                                        width: 16.25,
                                        height: 16.25,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 16.25,
                                          height: 16.25,
                                        ),
                                      ),
                                      Container(
                                        // Kmo (I86:539;131:368)
                                        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                        child: Text(
                                          '2',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // nimbuspluscircleTt1 (I86:539;131:364)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 1.38),
                                        width: 17.5,
                                        height: 16.5,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 17.5,
                                          height: 16.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupqzbwkMK (3HNJcaueFVmhyAV3MtQzbw)
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 14),
                            padding: EdgeInsets.fromLTRB(13, 15, 22.5, 19),
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
                                  // rectangle5766E1b (I86:539;119:517)
                                  margin: EdgeInsets.fromLTRB(0, 4, 11, 0),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Color(0xff000000)),
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Container(
                                  // kkd (I86:539;119:329)
                                  margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                                  width: 97,
                                  height: 82,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/esteh.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroup2svd2y3 (3HNJoQvw99kT6qNTNd2svd)
                                  margin: EdgeInsets.fromLTRB(0, 3, 27, 9),
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // estehyNV (I86:539;119:330)
                                        margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
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
                                        // rasataroH8H (I86:539;119:331)
                                        margin: EdgeInsets.fromLTRB(2, 0, 0, 7),
                                        child: Text(
                                          'Rasa Macha',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // rp8000ymo (I86:539;119:332)
                                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                                  // jumlahbarangJZB (I86:539;131:415)
                                  margin: EdgeInsets.fromLTRB(0, 32, 0, 29),
                                  height: MediaQuery.of(context).size.width,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // vectore7F (I86:539;131:419)
                                        margin: EdgeInsets.fromLTRB(
                                            0, 0, 6.75, 0.75),
                                        width: 16.25,
                                        height: 16.25,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 16.25,
                                          height: 16.25,
                                        ),
                                      ),
                                      Container(
                                        // F73 (I86:539;131:420)
                                        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                        child: Text(
                                          '2',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // nimbuspluscirclexGM (I86:539;131:416)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 1.38),
                                        width: 17.5,
                                        height: 16.5,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 17.5,
                                          height: 16.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupaigmfgZ (3HNK4QVxDkVKu9XBYZaigM)
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 13),
                            padding: EdgeInsets.fromLTRB(13, 15, 22.5, 19),
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
                                  // rectangle5767JjX (I86:539;119:545)
                                  margin: EdgeInsets.fromLTRB(0, 4, 11, 0),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Color(0xff000000)),
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Container(
                                  // 2vR (I86:539;119:433)
                                  margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                                  width: 97,
                                  height: 82,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/esteh.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupb2bfkrR (3HNKDejYign6kySu1xb2BF)
                                  margin: EdgeInsets.fromLTRB(0, 3, 28, 9),
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // estehuDX (I86:539;119:434)
                                        'Es Teh',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Container(
                                        // rasataro2Z3 (I86:539;119:435)
                                        margin: EdgeInsets.fromLTRB(2, 0, 0, 7),
                                        child: Text(
                                          'Rasa Milk',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // rp8000ZJ5 (I86:539;119:436)
                                        margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
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
                                  // jumlahbarang3DF (I86:539;131:681)
                                  margin: EdgeInsets.fromLTRB(0, 32, 0, 29),
                                  height: MediaQuery.of(context).size.width,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // vectorP2D (I86:539;131:685)
                                        margin: EdgeInsets.fromLTRB(
                                            0, 0, 6.75, 0.75),
                                        width: 16.25,
                                        height: 16.25,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 16.25,
                                          height: 16.25,
                                        ),
                                      ),
                                      Container(
                                        // 7iu (I86:539;131:686)
                                        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                        child: Text(
                                          '2',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // nimbuspluscircleFq7 (I86:539;131:682)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 1.38),
                                        width: 17.5,
                                        height: 16.5,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 17.5,
                                          height: 16.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogrouptfv7kms (3HNKUPoywufvn3m9RGTfV7)
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            padding: EdgeInsets.fromLTRB(13, 16, 22.5, 18),
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
                                  // rectangle5768yPj (I86:539;119:574)
                                  margin: EdgeInsets.fromLTRB(0, 2, 11, 0),
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Color(0xff000000)),
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Container(
                                  // had (I86:539;119:438)
                                  margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                                  width: 97,
                                  height: 82,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/esteh.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroup7a6hqRw (3HNKd94Qk6Gc5Q1uMQ7a6H)
                                  margin: EdgeInsets.fromLTRB(0, 3, 28, 9),
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // estehxmT (I86:539;119:439)
                                        'Es Teh',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Container(
                                        // rasataro7eM (I86:539;119:440)
                                        margin: EdgeInsets.fromLTRB(2, 0, 0, 7),
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
                                      Container(
                                        // rp8000EU5 (I86:539;119:441)
                                        margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
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
                                  // jumlahbaranga29 (I86:539;131:322)
                                  margin: EdgeInsets.fromLTRB(0, 31, 0, 30),
                                  height: MediaQuery.of(context).size.width,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // vectorHhF (I86:539;129:158)
                                        margin: EdgeInsets.fromLTRB(
                                            0, 0, 6.75, 0.75),
                                        width: 16.25,
                                        height: 16.25,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 16.25,
                                          height: 16.25,
                                        ),
                                      ),
                                      Container(
                                        // dFK (I86:539;128:114)
                                        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                        child: Text(
                                          '2',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // nimbuspluscircle8hs (I86:539;131:113)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 1.38),
                                        width: 17.5,
                                        height: 16.5,
                                        child: Image.asset(
                                          "assets/esteh.png",
                                          width: 17.5,
                                          height: 16.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupj2u5Rws (3HNKroLKHMAZP73Qkdj2U5)
                      padding: EdgeInsets.fromLTRB(20, 22, 20, 22),
                      width: MediaQuery.of(context).size.width,
                      height: 158,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x499c9c9c),
                            offset: Offset(0, 0),
                            blurRadius: 27.7000007629,
                          ),
                        ],
                      ),
                      child: Text(
                        'Total: Rp 88.000',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // group7072Hz5 (86:627)
              left: 253,
              top: 750,
              child: Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                  color: Color(0xfffe1101),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x499c9c9c),
                      offset: Offset(0, 0),
                      blurRadius: 27.7000007629,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Hapus',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // selesaiv1T (119:315)
              left: 284,
              top: 32,
              child: Align(
                child: SizedBox(
                  width: 54,
                  height: 23,
                  child: Text(
                    'Selesai',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
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
    );
  }
}
