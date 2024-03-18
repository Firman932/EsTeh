import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // Import package connectivity
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lji/Admin/Dashboard/dashboard.dart';
import 'package:lji/FOR%20USER/BagianDashboard.dart';
import 'package:lji/SignIn.dart';
import 'package:lji/styles/dialog.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var auth = FirebaseAuth.instance;
  var isLogin = false;

  // Function to check if there is internet connection
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
    navigateToNextScreen();
  }

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  // Function to initialize the app and handle navigation
  void initializeApp() async {
    bool isConnected = await checkInternetConnection();
    if (!isConnected) {
      // If there's no internet connection, we wait for it
      await waitForInternetConnection();
    } else {
      // If there's internet, continue with the app initialization
      checkIfLogin();
    }
  }

  // Function to wait for internet connection
  waitForInternetConnection() async {
    showDialog(
      context: context,
      builder: (context) => LostConnect(
        title: "Tidak Ada Koneksi Internet",
        content:
            "Maaf, sepertinya anda tidak terhubung ke internet saat ini. Pastikan anda terhubung ke jaringan wifi atau data saluler",
      ),
    );

    // Loop until internet connection is established
    while (true) {
      await Future.delayed(Duration(seconds: 3)); // Check every second
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        Navigator.pop(context); // Close the dialog
        break; // Exit the loop if internet connection is established
      }
    }

    // Continue with the app initialization after internet connection is established
    initializeApp();
  }

  // Function to navigate to the next screen based on user authentication
  void navigateToNextScreen() async {
    User? user = auth.currentUser;
    if (user != null && isLogin) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      String role = userSnapshot['role'];
      if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuUser()),
        );
      }
    } else {
      // Clear all existing routes and navigate to the SignScreen
      logout(); // Clear authentication cache
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
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
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .4,
              child: Image.asset(
                "assets/Logoes.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
