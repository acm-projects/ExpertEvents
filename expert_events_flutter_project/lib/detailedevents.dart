import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String eventName;
  final String eventDescription;
  final String eventDate;
  final String location;
  final String image;

  // Constructor to receive data from the previous page
  const EventDetailPage({
    Key? key,
    required this.eventName,
    required this.eventDescription,
    required this.eventDate,
    required this.location,
    required this.image,
  }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 244, 244),
        leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        size: 20,
        color: Colors.black,
      ),
    ),
  centerTitle: true,
    title: Text(
        widget.eventName, //name of the event
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      
        
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //DISPLAYS THE POSTER
            Container(
              height: 400,
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.fill,
                ),
              ),
            ),


            //DISPLAYS THE USERS WHO ARE GOING
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10
                ),
              child: Row(
                children: [
                   for (int index = 0; index < 5; index++)
                      Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 8.0 : 4.0, right: 4.0),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundImage: AssetImage('assets/profile_image$index.png'),
                        ),
                      ),
                      Spacer(),
                      MaterialButton(
                        minWidth: 25,
                        height: 30,
                        onPressed: () {
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                        side: BorderSide(
                        color: Colors.blue
                        ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "I'm Interested",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            

            // Display the event image
            
            
            SizedBox(
              height: 10,
              width: double.infinity,
            ),

            // Display other details about the event (description, date/time, location)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(widget.eventDescription),
                  SizedBox(height: 16),

                  Text(widget.eventDate,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(height: 16),

                  Text(widget.location,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


