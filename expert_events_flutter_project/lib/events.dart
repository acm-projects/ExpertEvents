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
    return await eventCollection.doc(evName).set ({
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
 
 Future<String?> getPosterLink(String eventUID) async {
    try {
      uid = eventUID;
      DocumentSnapshot eventSnapshot = await eventCollection.doc(uid).get();
      if (eventSnapshot.exists) {
        Map<String, dynamic>? eventData = eventSnapshot.data() as Map<String, dynamic>?;
        return eventData?['Poster Link'];
      } else {
        print('Event with UID $uid does not exist.');
        return null;
      }
    } catch (e) {
      print('Error fetching poster link: $e');
      return null;
    }
  }

// Future<String> getPosterLink(String eventUID) async {
//   try {
//     uid = eventUID;
//     final DocumentSnapshot eventSnapshot = await eventCollection.doc(eventUID).get();
//     if (eventSnapshot.exists) {
//       final Map<String, dynamic>? eventData = eventSnapshot.data() as Map<String, dynamic>?;
//       return eventData?['Poster Link'] ?? '';
//     } else {
//       print('Event with UID $uid does not exist.');
//       return ''; // or throw an error, depending on your requirements
//     }
//   } catch (e) {
//     print('Error fetching poster link: $e');
//     return ''; // or throw an error, depending on your requirements
//   }
// }

}