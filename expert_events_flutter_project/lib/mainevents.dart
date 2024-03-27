import 'package:flutter/material.dart';
import 'package:myapp/detailedevents.dart';
import 'package:myapp/profile.dart';

import 'package:myapp/friendsPage.dart';
import 'package:myapp/uploadposter.dart';

import 'notificationspage.dart';

class MainEvents extends StatelessWidget {
  const MainEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main events page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Map<String, bool> isHeartClicked = {};
  Map<String, bool> isBellClicked = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Main Events"),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/experteventslogo.jpg'),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogoAndName("assets/acmutd_logo.jpg", "ACM"),
            _buildPoster("assets/acm_poster.jpg", 'acm'),

            _buildLogoAndName("assets/suaablogo.png", "SUAAB"),
            _buildPoster("assets/SUAAB_poster.jpg", 'suaab'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        iconSize: 30,
        unselectedFontSize: 15,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Notifications",
            backgroundColor: Colors.red,
          ),
           BottomNavigationBarItem(
             icon: Icon(Icons.add),
             label: "Upload",
             backgroundColor: Colors.red,
           ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "My Friends",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.pink,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigate to the respective page based on the index
          switch (_currentIndex) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadPoster()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendsPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }

  // Updated _buildPoster method to accept an additional parameter 'id'
  Widget _buildPoster(String posterImage, String id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          //IF YOU PRESS ON THE POSTER, YOU WILL GO TO THE MORE DETAILED EVENT PAGE; NEED TO UPDATE WITH SPECIFIC EVENT INFORMATION (FROM BACK END?)
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => EventDetailPage(eventName: 'Event B)', eventDescription: 'This is a description of the event that the user pressed. Later on, this needs to be replaced with the description that the organization loads in. I think this will be done with information stored in back end :D', eventDate: 'Today :O', image: posterImage, location: 'ECSS 2.412')),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(posterImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
        ),

        // Contains code for the bell, heart, and share icons
        Container(
          color: Colors.grey.shade300,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                /*LikeButton(
                  isLiked: isHeartClicked[id] ?? false,
                  onTap: (bool isLiked) {
                    setState(() {
                      isHeartClicked[id] = !(isHeartClicked[id] ?? false);
                    });
                    return Future.value(!isLiked);
                  },
                  animationDuration: Duration(milliseconds: 1000),
                ),*/
                SizedBox(width: 5),
                /*GestureDetector(
                  onTap: () {
                    setState(() {
                      isBellClicked[id] = !(isBellClicked[id] ?? false);
                    });
                  },
                  child: Icon(
                    Icons.notifications,
                    size: 30.0,
                    color: isBellClicked[id] ?? false ? Colors.yellow : null,
                  ),
                ),*/
                TextButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: Text(
                    "I'm interested",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.share,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ),

        //for remind me button
        /*Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blue,
          child: Row(
            children: [
              Text(
                "Remind me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5), // Add space between text and icon
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white, // Optionally, set icon color
              ),
            ],
          ),
        ),*/
      ],
    );
  }

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
                  color: Colors.black,
                  width: 2.0,
                ),
                image: DecorationImage(
                  image: AssetImage(logoImage),
                  fit: BoxFit.cover,
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
}
