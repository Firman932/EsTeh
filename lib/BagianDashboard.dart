import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/search.dart';
import 'package:lji/Keranjang.dart';
import 'package:lji/NotifikasiUser.dart';
import 'package:lji/TampilanUserKeranjang.dart';
import 'package:lji/filterUser.dart';
import 'package:lji/listMenuUser.dart';
import 'package:lji/login01.dart';

class MenuUser extends StatelessWidget {
  const MenuUser({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Menu',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              height: 3,
              color: Color(0xff000000),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            // Tambahkan fungsi yang ingin dijalankan saat ikon leading ditekan
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              left: 10 + MediaQuery.of(context).padding.left,
            ),
            child: Image.asset(
              "assets/log.png",
              width: 24,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotifUser()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/notif.png",
                width: 24,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(
                right: 10 + MediaQuery.of(context).padding.right),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeranjangPage02()),
                );
                // Handle cart icon press
              },
              child: Image.asset(
                "assets/keranjang.png",
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Search(),
              SizedBox(height: 15),
              FilterUser(),
              ListUser(),
              ListUser(),
              ListUser(),
              ListUser(),
              ListUser(),
            ],
          ),
        ),
      ),
    );
  }
}
