import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';


class MessageModel {
    
    late CollectionReference userCollection;
    String receiverId = '';
    String senderId = '';
    String text = '';
    DateTime sentTime = DateTime.now();


    String uID = '';

    MessageModel(toId) {
        final FirebaseAuthService _auth = FirebaseAuthService();
        String uID = _auth.getUserID();
        this.senderId = uID;
        this.receiverId = toId;
        userCollection = FirebaseFirestore.instance.collection('Users');
        
    }

    Map<String, dynamic> toJson() => {
        'receiverId': receiverId,
        'senderId': senderId,
        'sentTime': sentTime,
        'text': text,
    };

     //User messages
    Future addMessage(String text) async {
         this.text = text;
         userCollection.doc(this.receiverId).collection('UserMessages').add(this.toJson());
         userCollection.doc(this.senderId).collection('UserMessages').add(this.toJson());
    }
}