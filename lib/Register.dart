import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lji/Admin/Dashboard/dashboard.dart';
import 'package:lji/DataBasePHPMYSQL/TextFieldRegister.dart';
import 'package:lji/SignIn.dart';
// import 'package:lji/FOR%20USER/BagianDashboard.dart';
import 'package:lji/snackbarlogin.dart';
// import 'package:lji/styles/color.dart';
import 'package:lji/DataBasePHPMYSQL/FunctionRegister.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _Registerstate createState() => _Registerstate();
}

class _Registerstate extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserController usercontroller = Get.put(UserController());
  bool isloading = false;
  bool isPasswordVisible = false;

  void registration(UserController userController) async {
    String USERNAME = emailController.text.trim();
    String PASSWORD = passwordController.text.trim();

    if (USERNAME.isEmpty) {
      showCustomSnackBar('Type is your email');
    } else if (!GetUtils.isEmail(USERNAME)) {
      showCustomSnackBar('Valid Email Addres', title: "Username");
    } else if (PASSWORD.length < 6) {
      showCustomSnackBar('Password cannot be less than six characthers',
          title: "Password");
    } else if (PASSWORD.isEmpty) {
      showCustomSnackBar('Type your password', title: "Password");
    } else {
      setState(() {
        isloading = true;
      });
      try {
        bool succes = await usercontroller.registerUser(USERNAME, PASSWORD);
        if (succes) {
          Get.to(RegisterScreen());
        } else {
          showCustomSnackBar('Registration failed try again',
              title: "Registration");
        }
      } catch (e) {
        print('Error during registration: $e');
        showCustomSnackBar('An error accured during registration',
            title: "Registration");
      } finally {
        setState(() {
          isloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: screenWidth,
            height:
                100, // Perhatikan penggunaan nilai ini, pastikan sesuai kebutuhan
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
                  padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                  width: screenWidth,
                  height: 170 + MediaQuery.of(context).padding.horizontal,
                  child: Image.asset(
                    "assets/Logoes.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 13),
                  padding: EdgeInsets.fromLTRB(28, 20, 28, 50),
                  width: screenWidth,
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
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          'Registrasi',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff5cc818),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 0, 35),
                        child: Text(
                          'Buatlah email dan password',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      RegisterInput(
                        hintText: "Email",
                        textController: emailController,
                        leftIcon: Icons.email,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegisterInput(
                        hintText: "Password",
                        textController: passwordController,
                        leftIcon: Icons.password,
                        isObsecure: !isPasswordVisible,
                        rightIcon: isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onRightconPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ), // Add your email and password input fields here
                      // ...
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 65,
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
                                  builder: (context) => Dashboard(),
                                ),
                              );
                            } else {
                              // For other emails, perform user registration
                              registration(UserController());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignScreen(),
                                  ));
                            }
                          },
                          child: Center(
                            child: Text(
                              'Registrasi',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
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
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Have an account already",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
