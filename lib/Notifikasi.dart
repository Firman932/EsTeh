import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfe1101),
        title: Container(
          margin: EdgeInsets.all(10),
          child: RichText(
            text: TextSpan(
              text: "Notifikasi",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: EdgeInsets.all(8), // Adjust the padding for spacing
          itemCount: 5, // Replace with the actual number of notifications
          itemBuilder: (context, index) {
            // Placeholder data for demonstration purposes
            String title = "Notifikasi $index";
            String message = "Ini adalah notifikasi";
            Color textColor = Colors.black; // Alternating text color
            Color backgroundColor = Color.fromRGBO(
                239, 233, 243, 1); // Alternating background color

            return Column(
              children: [
                SizedBox(height: 8), // Add space above each item
                Card(
                  elevation: 3,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          message,
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                      ),
                      onTap: () {
                        // Handle notification tap
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
