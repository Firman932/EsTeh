import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Register.dart';
import 'package:lji/SignIn.dart';
import 'package:lji/login01.dart';

class LogoutBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 220,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 6),
              Text(
                'Logout',
                style: GoogleFonts.poppins(
                    fontSize: 28, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                'Apakah kamu yakin ingin logout?',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Pop the bottom sheet
                    },
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignScreen()));
                      // Navigate to the next page
                    },
                    child: Text('Oke',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff49A013))),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
