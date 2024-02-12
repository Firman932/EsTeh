import 'package:flutter/material.dart';
import 'package:lji/BagianDashboard.dart';
import 'package:lji/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuUser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
