import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String uid;
  late CollectionReference eventCollection;
  late CollectionReference reviewsCollection;
  DatabaseService (this.uid) {
     eventCollection = FirebaseFirestore.instance.collection('Events');
    reviewsCollection = eventCollection.doc(uid).collection('Reviews');
  }


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

 Future addReview(String authName, String description, int rating) async {
   await reviewsCollection.add({
    'Name' : authName,
    'Review' : description,
    'Rating' : rating,
   }); 
 }
}
