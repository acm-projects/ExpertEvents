import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String uid;
  DatabaseService (this.uid);

  final CollectionReference eventCollection = FirebaseFirestore.instance.collection('Events');


  Future updateEventData( String evName, String orgName, String descrip, String location, String time, String poster) async {
    return await eventCollection.doc(uid).set ({
      'Event Name' : evName,
      'Organization' : orgName,
      'Description' : descrip,
      'Location' : location,
      'Time' : time,
      'Poster Link' : poster,
    });

  }
}
