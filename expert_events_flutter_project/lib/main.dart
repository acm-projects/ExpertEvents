//This was starter code (template)
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

//some packages that we need
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';



// Future main() async{
//  
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

//main runApp
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(const MaterialApp(
  home: Home(),
  ));
  
} 

class MyTextField extends StatelessWidget
{
  //for controlling what the user types in
  final TextEditingController controller;
  //for hinting what the user should type in
  final String hintText;
  //obscures the password (so you can't see it ;D)
  final bool obscureText;

  //something is going on here but it's needed
  const MyTextField({
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
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
    );
  }
}

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
      body: Center(
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


