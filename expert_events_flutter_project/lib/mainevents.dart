import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// class Events extends StatelessWidget {
//   const Events({super.key});
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold (
//       appBar: AppBar(
//       ),
//       body: const Center(
//         child: Text("This is another page"),
//       ),
//     );
//   }
//
//   //Need this for some reason :/
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Bar Demo',
      home: HomePage(),
    );
    // TODO: implement build
  }
}

class HomePage extends StatefulWidget{
  const HomePage({
    Key? key,
}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Main Events"),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0), // Adjust the left padding as needed
          child: IconButton(
            onPressed: (){},
            icon: Image.asset('assets/experteventslogo.jpg'),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0), // Adjust the right padding as needed
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.add), // Example icon, replace it with your desired icon
            ),
          ),
        ],
      ),

      //Acm logo container
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade400,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 2.0, right: 8.0, top: 10.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      shape: BoxShape.circle,
                    ),// Adjust padding as needed
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      radius: 25,
                      backgroundImage: AssetImage("assets/acmutd_logo.jpg"),
                      foregroundImage: AssetImage("assets/acmutd_logo.jpg"),
                    ),
                    width: 60, // Replace Icons.star with the desired icon
                  ),
                  Text(
                    "ACM",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),

            Container(
              height: 400,
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/acm_poster.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),

            Column(
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.blue,
                      height: 143,
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.all(31),
                        child: Text("Date: 2/2/2024\n"
                            "Time: 7:30 PM\n"
                            "Location: ECSS 2.415"),
                      ),
                    ),

                    Container(
                      color: Colors.purple,
                      height: 143,
                      width: 211,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.notifications,
                          size: 70,
                        ), // Using built-in bell icon
                        color: Colors.white, // Adjust icon color as needed
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar:
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: GNav(
                gap: 8,
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                padding: EdgeInsets.all(16),
                tabs: const [
                  GButton(icon:
                  Icons.home,
                      text: "Home"),

                  GButton(icon: Icons.favorite_border,
                    text: "Likes",),

                  GButton(icon: Icons.search,
                    text: 'Search',),

                  GButton(icon: Icons.settings,
                    text: "Settings",),
                ],
              ),
            ),
          ),
    );
  }
}

