import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:lji/splash_screen.dart';

import 'package:lji/Notifikasi.dart';
import 'package:lji/Profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 32, 143, 207)),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
