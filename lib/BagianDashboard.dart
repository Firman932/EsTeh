import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/search.dart';
import 'package:lji/Admin/History/history.dart';
import 'package:lji/History.dart';
import 'package:lji/Keranjang.dart';
import 'package:lji/NotifikasiUser.dart';
import 'package:lji/TampilanUserKeranjang.dart';
import 'package:lji/filterUser.dart';
import 'package:lji/listMenuUser.dart';
import 'package:lji/login01.dart';
import 'package:lji/bottomlogout.dart';
import 'package:lji/CustomHistori.dart';

class MenuUser extends StatefulWidget {
  MenuUser({Key? key}) : super(key: key);

  @override
  _MenuUserState createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  void _showLogoutBottomSheet(BuildContext context) {
    LogoutBottomSheet.show(context);
  }

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
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                _showLogoutBottomSheet(context);
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
          ],
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
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Image.asset(
                "assets/notif.png",
                width: 22,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Riwayat()),
                );
                // Handle cart icon press
              },
              child: Image.asset(
                "assets/histori.png",
                height: 40,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            margin: EdgeInsets.only(
                right: 15 + MediaQuery.of(context).padding.right),
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
                width: 22,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Search(),
            SizedBox(height: 15),
            FilterUser(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      10, // Ubah sesuai dengan jumlah item yang ingin ditampilkan
                  itemBuilder: (context, index) {
                    return ListUser(); // Ganti dengan item yang ingin ditampilkan
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
