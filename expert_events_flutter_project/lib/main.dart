import 'package:expert_events_flutter_project/signup.dart';
import 'package:flutter/material.dart';
import 'package:expert_events_flutter_project/login.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      home: SignUp(),
    );*/
    //just made a random home screen before moving into sign up page
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                    Text(
                      "Welcome to Expert Events!",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      ),
                    ),
                    SizedBox(
                     height: 20,
                    ),
                  ]
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset("assets/ExpertEventsLogo.png"),
                ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}