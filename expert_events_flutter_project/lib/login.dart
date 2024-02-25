import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/mainevents.dart';
import 'package:myapp/signup.dart';
import 'mytextfield.dart';

class LoginPage extends StatelessWidget
{
  int? _sliding = 0;

  //for sliding bar
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    //main page
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 244, 244),
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
                      controller: usernameController,
                      hintText: 'Username',
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
                  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not a member?",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),
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

  void setState(Null Function() param0) {}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}