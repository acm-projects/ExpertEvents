import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel{

    final String? email;
    //final String? username;
    final String? id;

    UserModel({this.id, this.email});

    static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
        return UserModel(
        //username: snapshot['username'],
        email: snapshot['email'],
        id: snapshot['id'],
        );
    }

    Map<String, dynamic> toJson(){
        return{
            //"username": username,
            "email": email,
            "id": id,
        };
    }
}


void _createData(UserModel userModel){
    final userCollection = FirebaseFirestore.instance.collection("Users");
    // final eventCollection = userCollection.collection('userEventCollection');

    String id = userCollection.doc().id; //generates random ID for document

    final newUser = UserModel(
        //username: userModel.username,
        email: userModel.email,
        id: id,
    ).toJson();

    userCollection.doc(id).set(newUser);
}

// void _addUserEvent(UserModel userModel){
//     final newEvent = 
// }

// void _deleteUserEvent(){
    
// }

// _addUserFriend
