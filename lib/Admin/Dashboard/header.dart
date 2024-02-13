import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                        Icon(
                          Icons.history,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.notifications,
                          size: 25,
                        )
                      ],
                    )
                  ],
                );
  }
}