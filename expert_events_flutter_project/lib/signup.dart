import 'package:flutter/material.dart';
import 'package:myapp/mytextfield.dart';
import 'login.dart';

//import 'package:expert_events_flutter_project/login.dart';

class SignUp extends StatelessWidget {

  final UserType userType = UserType.user; //sets the user type as individual to default

  final TextEditingController emailController = TextEditingController();
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
                    obscureText: false,
                  ),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.all(0),
                  child: MyTextField(
                    controller: repasswordController,
                    hintText: 'Confirm Password',
                    obscureText: false,
                  ),
                ),
              ],
            ),

        //<Widget>[
                //   InputText(label: "Username"),
                //   InputText(label: "Email"),
                //   InputText(label: "Password", obscureText: true),
                //   InputText(label: "Confirm Password", obscureText: true),

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
              Container(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
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
