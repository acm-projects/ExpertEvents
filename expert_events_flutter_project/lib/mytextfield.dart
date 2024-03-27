import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget
{
  //for controlling what the user types in
  final TextEditingController controller;
  //for hinting what the user should type in
  final String hintText;
  //obscures the password (so you can't see it ;D)
  final bool obscureText;

  //something is going on here but it's needed
   MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //Username and password fields
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
    );
  }
}