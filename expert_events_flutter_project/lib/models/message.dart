import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';

class Message1 {
  String text;
  Timestamp sentTime;

  Message1({
    required this.text,
    required this.sentTime,
  });

  Message1.fromJson(Map<String?, Object?> json)
      : this(
          text: json['text']! as String,
          sentTime: json['sentTime']! as Timestamp,
        );

  Message1 copyWith({
    String? text,
    Timestamp? sentTime,
  }) {
    return Message1(
        text: text ?? this.text,
        sentTime: sentTime ?? this.sentTime,
    );
  }

  Map<String, Object?> toJson() => {
      'text': text,
      'sentTime': sentTime,
   
  };
}
