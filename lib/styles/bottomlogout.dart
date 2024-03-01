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
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25),
                child: Text(
                  'Apakah kamu yakin ingin logout?',
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, // Mengatseur ruang di antara tombol
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Pop the bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      // Warna latar belakang tombol
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignScreen()),
                      );
                      // Navigate to the next page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xff49A013), // Warna latar belakang tombol
                    ),
                    child: Text(
                      'Oke',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
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
