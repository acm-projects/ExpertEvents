import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:like_button/like_button.dart';

class MainEvents extends StatelessWidget {
  const MainEvents({Key? key}) : super(key: key);

  //Name of app title
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main events page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //For bell icon turning yellow
  bool isBellClicked = false;

  //Function for building logoImage and name
  Widget _buildLogoAndName(String logoImage, String name) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
                image: DecorationImage(
                  image: AssetImage(logoImage),
                  fit: BoxFit.cover, // Adjust the image fit as needed
                ),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  //Building the poster
  Widget _buildPoster(String posterImage) {
    return Container(
      height: 400,
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(posterImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  //Top right corner for + sign
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Main"),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0), // Adjust the left padding as needed
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/experteventslogo.jpg'),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0), // Adjust the right padding as needed
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add), // Example icon, replace it with your desired icon
            ),
          ),
        ],
      ),

      //Main program for the body
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Call the functions to build the poster, logo, name
            _buildLogoAndName("assets/acmutd_logo.jpg", "ACM"),
            _buildPoster("assets/acm_poster.jpg"),

            // _buildLogoAndName("assets/acmutd_logo.jpg", "ACM"),
            // _buildPoster("assets/acm_poster.jpg"),

            //Contains code for the bell icon turning yellow
            Container(
              color: Colors.white10,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        LikeButton(
                          animationDuration: Duration(milliseconds: 1000),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isBellClicked = !isBellClicked;
                            });
                          },
                          child: Icon(
                            Icons.notifications,
                            size: 30.0,
                            color: isBellClicked ? Colors.yellow : null,
                          ),
                        ),
                        SizedBox(width: 280),
                        Icon(
                          Icons.share,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      //Bottom navigation bar
      bottomNavigationBar: Container(
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
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.favorite_border, text: "Likes",),
              GButton(icon: Icons.search, text: 'Search',),
              GButton(icon: Icons.settings, text: "Settings",),
            ],
          ),
        ),
      ),
    );
  }
}
