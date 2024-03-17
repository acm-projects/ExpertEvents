//some packages that we need
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expert_events_flutter_project/login.dart';


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



// class MyTextField extends StatelessWidget
// {
//   //for controlling what the user types in
//   final TextEditingController controller;
//   //for hinting what the user should type in
//   final String hintText;
//   //obscures the password (so you can't see it ;D)
//   final bool obscureText;

//   //something is going on here but it's needed
//   const MyTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.obscureText,
//   }) : super(key: key);


/*
//need for sliding bar
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? _sliding = 0;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  
  //for sliding bar
  @override
  Widget build(BuildContext context) {
    
    //main page
    return Scaffold(
        backgroundColor: const Color(0xFFFFB181),
      //make sure the components are below the notch of the phone
      body: SafeArea(
        //prevents overflow of text
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'assets/experteventslogo.jpg',
                  width: 100,
                ),
                const SizedBox(height: 35),
                Text(
                  "Welcome to Expert Events!",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //is for space between the components
                const SizedBox(height: 25),

                //for username field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 10),

                //for password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 15),

                //for sliding bar :D
                CupertinoSlidingSegmentedControl(
                  padding: const EdgeInsets.all(15),
                  children:  {
                    0: buildSegment('Student'),
                    1: buildSegment('Organization'),
                  },
                  //basically changes the value when sliding between the two options
                  groupValue: _sliding,
                  onValueChanged: (int? newValue) {
                    setState(() {
                      _sliding = newValue;
                    });
                  },
                ),

                const SizedBox(height: 15),

                //login button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25), // Adjust the horizontal margin
                  child: ElevatedButton(
                    onPressed: () {
                      //stuff happens when the button is pressed (leads to main page)
                      _signIn();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(25),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 50), // Set minimum width to double.infinity
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //For sign in if your not a member
                //Includes GestureDetector where it detects a tap
                //On tap switches to another page
                // Center(
                //   child: GestureDetector(
                //     () {
                //       Navigator.push(
                //         context,
                //           MaterialPageRoute(builder: (context) => AnotherPage()),
                //       );
                //     },
                //     child: const Text(
                //       "Not a member? Sign in",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
        )
    );
  }

  //For cupertino segmented sliding bar
  Widget buildSegment(String text) => Container(
    padding: const EdgeInsets.all(15),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20),
    ),
  );

  void _signIn() async {
    String username = emailController.text;
    String password = passwordController.text;
    print("User has signed in");
    User? user = await _auth.signInWithEmailAndPassword(username, password);
    
    if (user != null) {
      print("User is successfully signed in");
    }
    else{
      print("An error occured when trying to sign in user");
    }

  }
}

//The other page (sign up page)
class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold (
      appBar: AppBar(
        title: const Text("Another page"),
      ),
      body: const Center(
        child: Text("This is another page"),
      ),
    );
  }

  //Need this for some reason :/
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
*/

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
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset("assets/ExpertEventsLogo.jpg"),
                ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    color: Colors.black,
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
                        color: Colors.white,
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
