import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 139, 23, 130),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: <Color>[Color(0xffa5cd14), Color(0xffffffff)],
              stops: <double>[0, 0.875],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 74),
                width: double.infinity,
                height: 155,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 300,
                    height: 144,
                    child: Image.asset("assets/Logoes.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 0, 15, 0),
                padding: EdgeInsets.fromLTRB(21, 17, 21, 38),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x499c9c9c),
                      offset: Offset(0, 0),
                      blurRadius: 27.7000007629,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(1, 0, 0, 5),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          height: 1.2125,
                          color: Color(0xff5cc818),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 24),
                      child: Text(
                        'Masukan email dan password',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    // Add your email and password input fields here
                    // ...
                    Container(
                      margin: EdgeInsets.fromLTRB(2, 0, 1, 0),
                      width: double.infinity,
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff55bc15)),
                        color: Color(0xff55bc15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            height: 1.2125,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
