import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/dashboard.dart';
import 'package:lji/BagianDashboard.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 155,
                  child: Image.asset("assets/Logoes.png", fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x499c9c9c),
                        offset: Offset(0, 0),
                        blurRadius: 27.7,
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
                            fontSize: 35,
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
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),

                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.symmetric(
                              vertical: 15, horizontal: 17),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            height: 1.3718750293,
                            letterSpacing: 0.78,
                            color: Color(0xff000000),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff000000), // Warna border
                              width: 1.0, // Ketebalan border
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Radius border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Color(0xff000000), // Warna border saat aktif
                              width: 1.0, // Ketebalan border
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Radius border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Color(0xff000000), // Warna border saat fokus
                              width: 2.0, // Ketebalan border saat fokus
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Radius border
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            height: 1.3718750293,
                            letterSpacing: 0.78,
                            color: Color(0xff000000),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff000000), // Warna border
                              width: 1.0, // Ketebalan border
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Radius border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Color(0xff000000), // Warna border saat aktif
                              width: 1.0, // Ketebalan border
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Radius border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Color(0xff000000), // Warna border saat fokus
                              width: 2.0, // Ketebalan border saat fokus
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Radius border
                          ),
                        ),
                      ),
                      // Add your email and password input fields here
                      // ...
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff55bc15)),
                          color: Color(0xff55bc15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Check if the email is 'admin'
                            if (emailController.text.toLowerCase() == 'admin') {
                              // If the email is 'admin', navigate to admin dashboard
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                              );
                            } else {
                              // For other emails, navigate to user dashboard
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuUser()),
                              );
                            }
                          },
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
