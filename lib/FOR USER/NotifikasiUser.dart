import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/FOR%20USER/NotifUser/CustomDonNotif.dart';
import 'package:lji/FOR%20USER/NotifUser/CustomReqNotif.dart';
import 'package:lji/FOR%20USER/NotifUser/CustomDelNotif.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotifUser extends StatefulWidget {
   final String userId;
  const NotifUser({Key? key, required this.userId});

  @override
  State<NotifUser> createState() => _NotifUserState();
}

class _NotifUserState extends State<NotifUser> {
  late Stream<QuerySnapshot> _pesananStream;

  @override
  void initState() {
    super.initState();
    _pesananStream = FirebaseFirestore.instance
        .collection('pesanan')
        .where('id_pembeli', isEqualTo: widget.userId)
        .snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifikasi',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            height: 3,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _pesananStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // List of pesanan
          final List<DocumentSnapshot> pesananList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: pesananList.length,
            itemBuilder: (BuildContext context, int index) {
              final pesanan = pesananList[index];
              final status = pesanan['status'];

              // Menentukan jenis notifikasi berdasarkan status pesanan
              Widget notifWidget;
              if (status == 'pending') {
                notifWidget = NotifReq();
              } else if (status == 'Ditolak') {
                notifWidget = NotifDel();
              } else if (status == 'Diterima') {
                notifWidget = NotifS();
              } else {
                // Tampilkan widget default jika status tidak dikenali
                notifWidget = SizedBox();
              }

              return notifWidget;
            },
          );
        },
      ),
    );
  }
}
