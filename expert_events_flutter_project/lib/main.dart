import 'package:expert_events_flutter_project/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home()); //App
}

class Home extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
    //just made a random home screen before moving into sign up page
    /*return Scaffold(
      body: SafeArea(
        child: Container(),)
    );*/
  }
}