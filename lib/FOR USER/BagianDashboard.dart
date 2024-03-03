import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/filter.dart';
import 'package:lji/Admin/Dashboard/search.dart';
import 'package:lji/Admin/History/history.dart';
import 'package:lji/FOR%20USER/NotifikasiUser.dart';
import 'package:lji/TampilanUserKeranjang.dart';
import 'package:lji/filterUser.dart';
import 'package:lji/FOR%20USER/listMenuUser.dart';
import 'package:lji/styles/bottomlogout.dart';

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
              fontSize: 22,
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
                child: Icon(
                  Icons.logout, // Ganti dengan ikon yang sesuai
                  size: 23,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotifUser()),
              );
            },
            child: Icon(
              Icons.notifications, // Ganti dengan ikon yang sesuai
              size: 23,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Riwayat()),
                );
              },
              child: Icon(
                Icons.history, // Ganti dengan ikon yang sesuai
                size: 23,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            margin: EdgeInsets.only(
                right: 15 + MediaQuery.of(context).padding.right),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeranjangPage02()),
                );
              },
              child: Icon(
                Icons.shopping_cart, // Ganti dengan ikon yang sesuai
                size: 23,
                color: Colors.black,
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
            FilterAdmin(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('produk').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<DocumentSnapshot> produkList = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: produkList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot produk = produkList[index];
                      return ListUser(produkData: produk);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
