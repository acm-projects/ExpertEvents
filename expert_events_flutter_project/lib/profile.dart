import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Requests'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Request Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
