import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/messagingpage.dart';
import 'package:myapp/requestPage.dart';

class FriendsPage extends StatefulWidget {
  FriendsPage({super.key});

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final TextEditingController _textController =
  TextEditingController(text: 'Search here');

  List<String> allFriends = [
    "Dhruv Tripathi",
    "Shruti Gupta",
    "Charu Yuvaraja",
    "Sifat Islam",
    "Seeyan Shabbar Gaus Newaz",
    "Nadeeba Atiqui",
    "Millie Bobby Brown",
    "Charles Darwin",
    "Abraham Lincoln",
  ];

  List<String> displayedFriends = [];

  @override
  void initState() {
    super.initState();
    displayedFriends.addAll(allFriends);
  }

  void _searchFriends(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        displayedFriends.clear();
        displayedFriends.addAll(allFriends);
      } else {
        displayedFriends.clear();
        displayedFriends.addAll(allFriends
            .where((friend) =>
            friend.toLowerCase().contains(searchText.toLowerCase()))
            .toList());
      }
    });
  }

  Widget _buildAvatar(String fullName) {
    // Return the widget containing the avatar and name
    return Row(
      //avatar and name on the left
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.blue,
            child: Text(fullName.isNotEmpty ? fullName[0] : ''),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagePage(recipient: fullName,)));
          },
        child: Text(
          fullName,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        ),
      ],
    );
  }

  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Your Friends'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /* Cupertino Sliding Segmented Control */
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: CupertinoSlidingSegmentedControl<int>(
                padding: EdgeInsets.all(4),
                groupValue: groupValue,
                children: {
                  0: buildSegment('Your Friends'),
                  1: buildSegment("Requests"),
                },
                onValueChanged: (groupValue) {
                  setState(() => this.groupValue = groupValue);
                  if (groupValue == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestPage()),
                    );
                  }
                },
              ),
            ),
            /* ---------------------------------- */
            GestureDetector(
              onTap: () {
                // When tapped, give focus to the text field
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: [
                  Container(
                    color: CupertinoColors.systemOrange,
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: CupertinoTextField(
                        controller: _textController,
                        onChanged: _searchFriends,
                        placeholder: 'Search here',
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefix: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: displayedFriends.length,
                    itemBuilder: (context, index) {
                      return _buildAvatar(displayedFriends[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSegment(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(fontSize: 15,
        ),
      ),
    );
  }
}