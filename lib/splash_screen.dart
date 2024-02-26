import 'package:flutter/material.dart';
import 'package:lji/Register.dart';
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
        MaterialPageRoute(builder: (context) => RegisterScreen()),
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
        padding: EdgeInsets.fromLTRB(30, 328, 30, 328),
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
          child: SizedBox(
              width: 300,
              height: 144,
              child: Image.asset(
                "assets/Logoes.png",
                fit: BoxFit.cover,
              )),
        ),
      ),
    ));
  }
}
