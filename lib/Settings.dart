import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setelan"),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05),
        backgroundColor: Color(0xFFfe1101),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Indonesia"),
              subtitle: Text("Indonesia"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Add logic to change language
              },
            ),
            ListTile(
              title: Text("Tema"),
              subtitle: Text("Cerah"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Add logic to change app theme
              },
            ),
            SizedBox(height: 20),
            Text(
              "Setelan Akun",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Ganti Kata Sandi"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Add logic to change password
              },
            ),
            ListTile(
              title: Text("Privasi"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Add logic to manage privacy settings
              },
            ),
            SizedBox(height: 20),
            Text(
              "About",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Versi"),
              subtitle: Text("1.0.0"),
              onTap: () {
                // Add logic to display app version
              },
            ),
            ListTile(
              title: Text("Syarat dan Ketentuan"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Add logic to show terms and conditions
              },
            ),
          ],
        ),
      ),
    );
  }
}
