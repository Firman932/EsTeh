import 'package:flutter/material.dart';
import 'package:lji/Admin/Dashboard/dashboard.dart';
import 'package:lji/Register.dart';
import 'package:lji/SignIn.dart';
import 'login01.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate an asynchronous operation (e.g., fetching data) before navigating
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // splashscreen5Vn (93:649)
      width: double.infinity,
      height: double.infinity,
      child: Container(
        // splashcs18Y (9:726)
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, -1.031),
            end: Alignment(1, 1),
            colors: <Color>[Color(0xffa5cd14), Color(0xff55bc15)],
            stops: <double>[0.285, 0.837],
          ),
        ),
        child: Center(
          // logoestehnusantara2TWL (93:1434)
          child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .4,
              child: Image.asset(
                "assets/Logoes.png",
                fit: BoxFit.contain,
              )),
        ),
      ),
    ));
  }
}
