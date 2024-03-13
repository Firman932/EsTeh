import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  MenuUser({
    Key? key,
  }) : super(key: key);

  @override
  _MenuUserState createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  String selectedCategory = "Minuman";
  late Stream<QuerySnapshot> produkStream;
  List<DocumentSnapshot> produkList = [];

  void initState() {
    super
        .initState(); // Panggil fungsi untuk mengambil data produk saat widget diinisialisasi
    produkStream = FirebaseFirestore.instance.collection('produk').snapshots();
    produkStream.listen((QuerySnapshot querySnapshot) {
      setState(() {
        produkList = querySnapshot.docs.toList();
      });
    });
  }

  void _showLogoutBottomSheet(BuildContext context) {
    LogoutBottomSheet.show(context, AuthService());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('onWillPop called'); // Add this line for debugging

        // Show exit confirmation dialog
        bool exitConfirmed = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Konfirmasi'),
            content:
                const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Ya'),
              ),
            ],
          ),
        );

        // If user confirms exit or dialog is dismissed, exit the app
        if (exitConfirmed) {
          SystemNavigator.pop();
          return true; // Return true to prevent further handling
        }

        return false; // Return false to allow normal back navigation
      },
      child: Scaffold(
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
              FilterUser(
                onMinumanSelected: (category) {
                  setState(() {
                    selectedCategory = "Minuman";
                  });
                },
                onMakananSelected: (category) {
                  setState(() {
                    selectedCategory = "Makanan";
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: produkStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text("Tidak ada produk yang tersedia."),
                      );
                    }
                    produkList = snapshot.data!.docs
                        .where((produk) =>
                            produk['kategori_produk'] == selectedCategory &&
                            produk['kategori_produk'] != null)
                        .toList();
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
      ),
    );
  }
}
