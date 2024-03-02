import 'package:flutter/material.dart';
import 'model/friend_model.dart';

class FriendsPage extends StatelessWidget {
  FriendsPage({super.key});

  static List<FriendModel> friend_list = [
    FriendModel("Shruti", 100, "Frontend"),
    FriendModel("Nadeeba", 100, "Project Manager"),
    FriendModel("Charu", 100, "Backend"),
    FriendModel("Dhruv", 100, "Frontend"),
    FriendModel("Sifat", 100, "Fullstack"),
    FriendModel("Seeyan", 100, "Backend"),
  ];

  final List<FriendModel> display_list = List.from(friend_list);

  void updateList(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Friends"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for your friends",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Milly Bob Brown",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    display_list[index].name!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('${display_list[index].age!}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
