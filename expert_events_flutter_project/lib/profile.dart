import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget buildTextContainer(String text, {TextStyle? textStyle}) {
    return Column(
      children: [
        Container(
          height: 2,
          color: Colors.black,
          width: 350,
        ),
        Container(
          margin: EdgeInsets.only(left: 30),
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: textStyle ?? TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Your Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            buildTextContainer("Personal Info"),
            SizedBox(height: 20),
            buildTextContainer("Payments"),
            SizedBox(height: 20),
            buildTextContainer("Security & Settings"),
            SizedBox(height: 20),
            buildTextContainer("Support"),
            SizedBox(height: 20),
            buildTextContainer("Logout"),
            SizedBox(height: 20),
            buildTextContainer("Delete Account",
                textStyle:
                TextStyle(fontSize: 25,
                    color: Colors.red)),
          ],
        ),
      ),
    );
  }
}