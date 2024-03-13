import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
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
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.blue,
                  child: Text(fullName.isNotEmpty ? fullName[0] : ''),
                ),
              ),
              Flexible(
                child: Text(
                  fullName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                // Handle accept action
              },
              icon: Icon(Icons.check),
              color: Colors.green,
            ),
            IconButton(
              onPressed: () {
                // Handle decline action
              },
              icon: Icon(Icons.close),
              color: Colors.red,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Friend Requests'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
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
}
