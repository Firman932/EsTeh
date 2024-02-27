import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lji/DataBasePHPMYSQL/TextFieldSign.dart';
import 'package:lji/FOR%20USER/BagianDashboard.dart';
import 'package:lji/Register.dart';
// import 'package:lji/login01.dart';
import 'package:lji/Keranjang.dart';
import 'package:lji/splash_screen.dart';
import 'dart:convert';
import 'package:lji/SignIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
