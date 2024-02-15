import 'package:flutter/material.dart';
import 'package:lji/BagianDashboard.dart';
import 'package:lji/login01.dart';
import 'package:lji/Keranjang.dart';
import 'package:lji/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
