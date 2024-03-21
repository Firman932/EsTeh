// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/styles/color.dart';

class ListPendapatan extends StatefulWidget {
  final String tanggal;

  const ListPendapatan({required this.tanggal, });

  @override
  _ListPendapatanState createState() => _ListPendapatanState();
}

class _ListPendapatanState extends State<ListPendapatan> {
  @override
  Widget build(BuildContext context) {
    var tanggal;
    var waktu;
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.1,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(156, 156, 156, 0.29),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                width: 10,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Color.fromARGB(255, 73, 160, 19),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.monetization_on,
                    size: 22,
                    color: greenPrimary,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Pendapatan ',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    'Rp 500.000',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$tanggal',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      )
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.03),
            ],
          )
        ],
      ),
    );
  }
}
