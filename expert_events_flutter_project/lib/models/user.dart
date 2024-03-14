import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//UPDATED USER MODEL

class UserModel{

    late CollectionReference userEventsCollection;
    late CollectionReference userOrganizationsCollection;
    late CollectionReference userMessagesCollection;
    late CollectionReference userFriendsCollection;
    late CollectionReference userCollection;
    //final String uid;
    String id='';
    // final eventCollection = userCollection.collection('userEventCollection');
    
    UserModel(uid){
        userCollection = FirebaseFirestore.instance.collection('Users');
        id = uid; 
        userEventsCollection = userCollection.doc(id).collection('UserEvents');
        userOrganizationsCollection = userCollection.doc(id).collection('UserOrganizations');
        userMessagesCollection = userCollection.doc(id).collection('UserMessages');
        userFriendsCollection = userCollection.doc(id).collection('UserFriends');
     
    }
    
    Future createData(String fName, String lName, String email) async{
        return await userCollection.doc(id).set({
            'First Name': fName,
            'Last Name': lName,
            'Email': email,

        });
    }

    //User organizations
    Future addOrganization(String organizationId) async{
        await userOrganizationsCollection.add({
            'ID': organizationId,
        });
    }

    //User events
    Future addEvent(String eventId) async{
        await userEventsCollection.add({
            'ID': eventId,
        });
    }

    //User messages
    Future addMessage(String messagesId) async{
        await userMessagesCollection.add({
            'ID': messagesId,
        });
    }

    //User friends
    Future addFriend(String friendsId) async{
        await userFriendsCollection.add({
            'ID': friendsId,
        });
    }

    
}


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




