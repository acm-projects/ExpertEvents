import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User1 {
  String fName;
  String lName;
  String email;

 
  User1({
    required this.fName,
    required this.lName,
    required this.email,
  });

  User1.fromJson(Map<String?, Object?> json)
      : this(
          fName: json['First Name']! as String,
          lName: json['Last Name']! as String,
          email: json['Email']! as String,
        );

  User1 copyWith({
    String? fName,
    String? lName,
    String? email,
  }) {
    return User1(
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        email: email ?? this.email,
    );
  }

  Map<String, Object?> toJson() => {
      'First Name': fName,
      'Last Name': lName,
      'Email': email,
   
  };
  
}



//UPDATED USER MODEL

// class UserModel{

//     late CollectionReference userEventsCollection;
//     late CollectionReference userOrganizationsCollection;
//     late CollectionReference userMessagesCollection;
//     late CollectionReference userFriendsCollection;
//     late CollectionReference userCollection;
//     //final String uid;
//     String id='';
//     // final eventCollection = userCollection.collection('userEventCollection');
    
//     UserModel(uid){
//         userCollection = FirebaseFirestore.instance.collection('Users');
//         id = uid; 
//         userEventsCollection = userCollection.doc(id).collection('UserEvents');
//         userOrganizationsCollection = userCollection.doc(id).collection('UserOrganizations');
//         userMessagesCollection = userCollection.doc(id).collection('UserMessages');
//         userFriendsCollection = userCollection.doc(id).collection('UserFriends');
     
//     }
    

//     Future createData(String fName, String lName, String email) async{
//         return await userCollection.doc(id).set({
//             'First Name': fName,
//             'Last Name': lName,
//             'Email': email,

//         });
//     }


//     //User organizations
//     Future addOrganization(String organizationId) async{
//         await userOrganizationsCollection.add({
//             'ID': organizationId,
//         });
//     }

//     //User events
//     Future addEvent(String eventId) async{
//         await userEventsCollection.add({
//             'ID': eventId,
//         });
//     }

    

//     //User friends
//     Future addFriend(String friendName, String friendsId) async{
//         await userFriendsCollection.add({
//             'Name': friendName,
//             'ID': friendsId,
//         });
//     }

//     //This method returns userFriends list
//     Future<List<Map<String, dynamic>>> getFriends() async {
//         // Access the Firestore collection containing users' friends
//         CollectionReference<Map<String, dynamic>>  
//             userFriendsCollection = userCollection.doc(id).collection('UserFriends');

//         // Retrieve all documents (user friends) from the collection
//         QuerySnapshot<Map<String, dynamic>> 
//             querySnapshot = await userFriendsCollection.get();

//         // Extract user data from QuerySnapshot and convert to List
//         List<Map<String, dynamic>> userFriends = [];
//         querySnapshot.docs.forEach((doc) {
//             userFriends.add(doc.data());
//         });

//         print (userFriends);
//         return userFriends;
//     }
    // //Here is the code to call this above function, this gives the users friends list, where user.uid is the signed in users id
    // List<Map<String, dynamic>>? userFriends = await UserModel(user.uid).getFriends() ?? null;

    




     //This method returns userMessages list
    //Stream<QuerySnapshot> getMessages() {
        // Access the Firestore collection containing users' friends
       // CollectionReference<Map<String, dynamic>>  
            //userMessagesCollection = userCollection.doc(id).collection('UserMessages');

        // Retrieve all documents (user friends) from the collection
        //QuerySnapshot<Map<String, dynamic>> 
            //querySnapshot = 
            //return userMessagesCollection.snapshots();

        // Extract user data from QuerySnapshot and convert to List
        // List<Map<String, dynamic>> userMessages = [];
        // querySnapshot.docs.forEach((doc) {
        //     userMessages.add(doc.data());
        // });

        // print (userMessages);
        // return userMessages;
    // }
    //Here is the code to call this above function, this gives the users messages list, where user.uid is the signed in users id
    //List<Map<String, dynamic>>? userMessages = await UserModel(user.uid).getMessages() ?? null;


    // String getInfoForNotification() {
    //     String notification = '';
    //     FirebaseAuth _auth = FirebaseAuth.instance;
    //     User? user = _auth.currentUser;
    //     CollectionReference<Map<String, dynamic>>  
    //         userFriendsCollection = userCollection.doc(id).collection('UserFriends');

    //     // Retrieve all documents (user friends) from the collection
    //     QuerySnapshot<Map<String, dynamic>> 
    //         querySnapshot = await userFriendsCollection.get();

    //     // Extract friends data from QuerySnapshot and convert to List
    //     List<Map<String, dynamic>> userFriends = [];
    //     querySnapshot.docs.forEach((doc) {
    //         userEventsCollection = doc.data().collection('UserEvents');
    //         notification = user
    //     });

    //     return userFriends;
    // }

// }


// OLD USER MODEL
// class UserModel{

//     final String? email;
//     //final String? username;
//     final String? id;


//     UserModel({this.id, this.email});

//     static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
//         return UserModel(
//         //username: snapshot['username'],
//         email: snapshot['email'],
//         id: snapshot['id'],
//         );
//     }

//     Map<String, dynamic> toJson(){
//         return{
//             //"username": username,
//             "email": email,
//             "id": id,
//         };
//     }
// }


// void _createData(UserModel userModel){
//     final userCollection = FirebaseFirestore.instance.collection("Users");
//     // final eventCollection = userCollection.collection('userEventCollection');

//     String id = userCollection.doc().id; //generates random ID for document

//     final newUser = UserModel(
//         //username: userModel.username,
//         email: userModel.email,
//         id: id,
//     ).toJson();

//     userCollection.doc(id).set(newUser);
// }




