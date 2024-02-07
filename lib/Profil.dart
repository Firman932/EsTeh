import 'package:flutter/material.dart';
import 'package:lji/login01.dart';
import 'package:lji/Settings.dart';

import 'package:lji/HistoryPage.dart';
import 'package:lji/MasaAktifBerlangganan.dart';
import 'package:lji/PusatBantuanPage.dart';

class ProfilePage extends StatelessWidget {
  final String profileImagePath = "assets/poster3.jpg";
  static const double outerMargin = 25.0;
  static const double innerPadding = 16.0;
  static const double sectionSpacing = 20.0;
  static const double sectionSpacingvv = 5.0; // Adjust the spacing value

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfe1101),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(outerMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(innerPadding),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(profileImagePath),
                    ),
                    SizedBox(height: sectionSpacing),
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: sectionSpacing),
                    Text(
                      "fiman092@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: sectionSpacing),
                    ElevatedButton(
                      onPressed: () {
                        // Add your action when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFfe1101), // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text("Edit Profile"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45), // Add space between sections

              // Placeholder content for additional features with icons

              FeatureItem("Histori Transaksi", Icons.history, Colors.purple),
              SizedBox(height: sectionSpacingvv), // Add space between sections
              FeatureItem(
                  "Masa Aktif Berlangganan", Icons.access_time, Colors.red),
              SizedBox(height: sectionSpacingvv), // Add space between sections
              FeatureItem("Pusat Bantuan", Icons.help, Colors.teal),
              SizedBox(height: sectionSpacingvv), // Add space between sections
              FeatureItem("Setelan", Icons.settings, Colors.indigo),
              SizedBox(height: sectionSpacingvv), // Add space between sections

              FeatureItem("Logout", Icons.exit_to_app, Colors.red),
              SizedBox(height: 10), // Add space after the Language feature
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  FeatureItem(this.text, this.icon, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 233, 243, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(text),
        onTap: () {
          // Add your action when the feature item is tapped
          if (text == "Setelan") {
            // Navigasi ke layar setelan di sini
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          } else if (text == "Logout") {
            // Show logout confirmation dialog
            _showLogoutConfirmationDialog(context);
          } else if (text == "Histori Transaksi") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryPage()));
          } else if (text == "Masa Aktif Berlangganan") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MasaAktifBerlanggananPage()));
          } else if (text == "Pusat Bantuan") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PusatBantuanPage()));
          }
        },
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Apakah kamu yakin ingin logout?"),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform logout action here
                // For example, you can navigate to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
