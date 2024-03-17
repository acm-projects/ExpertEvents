import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Your Notifications'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20), // Add padding to the top
            child: Text(
              "Upcoming Events",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20), // Add some vertical space
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: buildNotificationWidget(
              dateText: "March 10, 2024",
              logoImage: AssetImage('assets/acmutd_logo.jpg'),
              organizationName: "ACM",
            ),
          ),
          SizedBox(height: 20), // Add some vertical space
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: buildNotificationWidget(
              dateText: "April 5, 2024",
              logoImage: AssetImage('assets/suaablogo.png'),
              organizationName: "SUAAB",
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationWidget({
    required String dateText,
    required ImageProvider logoImage,
    required String organizationName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10), // Add some vertical space
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: ClipOval(
                child: Image(image: logoImage, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 15), // Add some horizontal space
            Padding(
              padding: EdgeInsets.only(top: 8.0), // Adjust top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    organizationName,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    dateText, // Display the date text
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}