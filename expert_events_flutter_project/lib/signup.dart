import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './mytextfield.dart';
import 'login.dart';

//import 'package:expert_events_flutter_project/login.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 247, 244, 244),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 244, 244),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                    'assets/ExpertEventsLogo2.png',
                    width: 100,
                  ),
                  const SizedBox(height: 20),
                  Text("Sign Up for Expert Events",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20),
                ],
              ),
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
              ),
              SizedBox(height: 20),

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

              SizedBox(height: 20),

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  color: Color.fromARGB(255, 247,157,101),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  child: Text("Sign Up", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already a member? ', style: TextStyle(fontWeight: FontWeight.bold)),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Customize the color as needed
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Padding(padding: EdgeInsets.only(bottom: 50)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSegment(String text) => Container(
    padding: const EdgeInsets.all(15),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20),
    ),
  );
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
      SizedBox(height: 30)
    ],
  );


}

enum UserType {
  user,
  organization,
}
