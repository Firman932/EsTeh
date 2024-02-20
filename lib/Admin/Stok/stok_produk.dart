import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/filter.dart';
import 'package:lji/Admin/Dashboard/list_menu.dart';
import 'package:lji/Admin/Dashboard/search.dart';
import 'package:lji/Admin/Dashboard/search_filter.dart';
import 'package:lji/Admin/History/history.dart';
import 'package:lji/Admin/Notifikasi/notifikasi.dart';
import 'package:lji/Admin/Stok/list_produk.dart';
import 'package:lji/filterUser.dart';

class StokProduk extends StatefulWidget {
  const StokProduk({super.key});

  @override
  State<StokProduk> createState() => _StokProdukState();
  static _StokProdukState of(BuildContext context) =>
      context.findAncestorStateOfType<_StokProdukState>()!;
}

class _StokProdukState extends State<StokProduk> {
  bool isChecklistMode = false;
  bool isAllChecked = false;
  List<bool> isCheckedList =
      List.generate(6, (index) => false); // Ganti jumlah item sesuai kebutuhan

  void activateChecklistMode() {
    setState(() {
      isChecklistMode = true;
      isAllChecked = false;
    });
  }

  void deactivateChecklistMode() {
    setState(() {
      isChecklistMode = false;
       isAllChecked = false;
    });
  }

  void toggleCheckAll(bool value) {
    setState(() {
      isCheckedList = List.generate(isCheckedList.length, (index) => value);
    });
  }

  void toggleItemCheck(int index) {
    setState(() {
      isCheckedList[index] = !isCheckedList[index];
    });
  }

  void toggleAllChecks(bool value) {
    setState(() {
      isAllChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Riwayat(),
                    ),
                  );
                },
                child: Icon(
                  Icons.history,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifikasi(),
                    ),
                  );
                },
                child: Icon(
                  Icons.notifications,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 13,
              )
            ],
            centerTitle: true,
            title: Text(
              "Produk",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w500),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                FilterUser(),
                SizedBox(
                  height: 10,
                ),
                SearchFilter(
                  isChecklistMode: isChecklistMode,
                  onCheckAll: toggleCheckAll,
                  onCancel: deactivateChecklistMode,
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 0,
                  height: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6, // Ganti dengan jumlah item yang sesuai
                    itemBuilder: (context, index) {
                      return ListProduk(
                        isChecklistMode: isChecklistMode,
                        isChecked: isCheckedList[index],
                        onToggleCheck: () {
                          toggleItemCheck(index);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
