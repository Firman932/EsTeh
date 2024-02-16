import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/History/history.dart';
import 'package:lji/Admin/Notifikasi/notifikasi.dart';
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi Radit",
                              style: GoogleFonts.inter(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          Text("Kamu adalah admin",
                              style: GoogleFonts.inter(
                                  fontSize: 11, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        children: [
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
                          )
                        ],
                      )
                    ],
                  ),
    );
  }
}