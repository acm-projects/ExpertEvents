import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Friend {
  String id;

  Friend({
    required this.id,
  });

  Friend.fromJson(Map<String?, Object?> json)
      : this(
          id: json['ID']! as String,
        );

  Friend copyWith({
    String? id,
  }) {
    return Friend(
        id: id ?? this.id,
    );
  }

  Map<String, Object?> toJson() => {
      'ID': id,
   
  };
  
}