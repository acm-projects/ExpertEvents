//some packages that we need
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login.dart';

//main runApp
void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
/*
//need for sliding bar
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
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

