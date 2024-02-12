import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xffa5cd14), Color(0xffffffff)],
            stops: <double>[0, 0.875],
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/Logoes.png"),
          ),
        ),
      ),
    );
  }
}
