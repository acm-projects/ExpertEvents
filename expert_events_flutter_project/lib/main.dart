//some packages that we need
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';


import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import 'uploadposter.dart';

import 'signup.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );

  runApp(MaterialApp(
    home: Home(),
    ));
} 


class Home extends StatelessWidget {

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
                      textAlign: TextAlign.center,
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
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset("assets/ExpertEventsLogo.jpg"),
                ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    color: Color.fromARGB(255, 242, 112, 89),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 242, 112, 89)
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    color: Color.fromARGB(255, 247,157,101),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255,247,157,101)
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  )
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}