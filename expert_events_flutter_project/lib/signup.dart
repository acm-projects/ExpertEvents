import 'package:flutter/material.dart';
import 'mytextfield.dart';
import 'login.dart';
// import 'package:expert_events_flutter_project/login.dart';

//user auth
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import '../models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../services/userdb_services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int groupValue = 0;

  final UserType userType = UserType.user; //sets the user type as individual to default

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  final FirebaseAuthService _auth = FirebaseAuthService();

  

  @override
  Widget build(BuildContext context) {
    Widget buildSegment(String text) => Container(
    padding: const EdgeInsets.all(15),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20),
    ),
    );


    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 247, 244, 244),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 244, 244),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back,
              size: 20,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                   Image.asset(
                  'assets/ExpertEventsLogo.jpg',
                  width: 100,
                ),
                const SizedBox(height: 35),
                  Text("Sign Up for Expert Events",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20),
                  Text("Create an account!",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                 Padding(
                  padding: EdgeInsets.all(0),
                  child: MyTextField(
                    controller: firstNameController, 
                    hintText: 'First Name', 
                    obscureText: false)
                ),

                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.all(0),
                  child: MyTextField(
                    controller: lastNameController, 
                    hintText: 'Last Name', 
                    obscureText: false)
                ),

                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.all(0),
                  child: MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                ),
               SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.all(0),
                  child: MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.all(0),
                  child: MyTextField(
                    controller: repasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                ),
              ],
            ),
                  //ALLOWS USERS TO REGISTER AS AN ORGANIZATION OR AN INDIVIDUAL
                  /*ListTile(
                  title: Text('Register as:'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Radio(
                      value: UserType.user,
                      groupValue: userType,
                      onChanged: (value) {
                        setState(() {
                          userType = value as UserType;
                        });
                      },
                    ),
                    Text('User'),
                    Radio(
                      value: UserType.organization,
                      groupValue: userType,
                      onChanged: (value) {
                        setState(() {
                          userType = value as UserType;
                        });
                      },
                    ),
                    Text('Organization'),
                  ],
                ),
              ),*/
               // ],
              ),
              SizedBox(height: 30),

              CupertinoSlidingSegmentedControl<int>(
                  padding: const EdgeInsets.all(0),
                  groupValue: groupValue,
                  children: {
                    0: buildSegment('Student'),
                    1: buildSegment('Organization'),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                ),

                SizedBox(height: 10),

              Container(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                  
                    _signUp(); 
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );

                  },
                  color: Color.fromARGB(255, 0, 0, 0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text("Sign Up", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already a member? '),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the LogIn page when pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Log In.',
                      style: TextStyle(
                        color: Colors.black, // Customize the color as needed
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }

  void _signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    //print("User has signed up");
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    
    if (user != null) {

      print("User is successfully signed up");

      final UsersService usersService = UsersService();
      User1 user = User1(
        fName: firstNameController.text,
        lName: lastNameController.text,
        email: email);
        usersService.addUser(user); //adds user to the database
      
    }
    else{
      print("An error occured when trying to sign up user");
    }

  }
}

Widget InputText({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: 8,
      ),
      TextField(
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
            hintText: label,
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 162, 86, 86))
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}

enum UserType {
  user,
  organization,
}




