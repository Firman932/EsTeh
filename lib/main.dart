import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lji/DataBasePHPMYSQL/FunctionRegister.dart';
import 'package:lji/DataBasePHPMYSQL/TextFieldSign.dart';
import 'package:lji/FOR%20USER/BagianDashboard.dart';
import 'package:lji/Register.dart';
// import 'package:lji/login01.dart';
import 'package:lji/Keranjang.dart';
import 'package:lji/splash_screen.dart';
import 'dart:convert';
import 'package:lji/SignIn.dart';

void main() {
  Get.put(UserController());
  WidgetsFlutterBinding.ensureInitialized();
  UserController userController = UserController();
  userController.onInit();
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
