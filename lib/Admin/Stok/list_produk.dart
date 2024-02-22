import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Create/create_produk.dart';
import 'package:lji/Admin/Stok/stok_produk.dart';

import '../../styles/dialog.dart';

class ListProduk extends StatelessWidget {
  final bool isChecklistMode;
  final bool isChecked;
  final VoidCallback onToggleCheck;

  const ListProduk(
      {Key? key,
      required this.isChecklistMode,
      required this.isChecked,
      required this.onToggleCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isChecklistMode) {
          onToggleCheck();
        } else {
          // Navigate to another page or perform an action
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahProduk(),
            ),
          );
        }
      },
      onLongPress: () {
        if (!isChecklistMode) {
          // Aktifkan mode checklist di StokProduk
          StokProduk.of(context).activateChecklistMode();
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: 116,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(156, 156, 156, 0.29),
              offset: Offset(0, 0),
              blurRadius: 55.5,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 97,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/teh taro.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  _buildTextInfo(),
                ],
              ),
              _buildActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Es Teh",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Rasa Taro",
                  style: GoogleFonts.poppins(
                      fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
          Text("Rp.8000",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Stok: 45",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
          if (isChecklistMode)
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              activeColor: Color.fromRGBO(73, 160, 19, 1),
              value: isChecked,
              onChanged: (value) {
                onToggleCheck();
              },
            ),
          SizedBox(height: 14),
          if (!isChecklistMode)
            _deleteActionButton(
                Icons.delete_outline_outlined, Colors.red, context),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _deleteActionButton(IconData icon, Color color, BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => DeleteDialog(),
          );
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        iconSize: 20,
        padding: EdgeInsets.zero,
        splashRadius: 24,
      ),
    );
  }
}

