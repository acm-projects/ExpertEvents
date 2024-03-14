import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expert_events_flutter_project/models/events.dart';

class OrgDatabaseService {
  String uid;
  late CollectionReference organizationCollection;
  late CollectionReference org_eventsCollection;
  late CollectionReference org_messagesCollection;
  late CollectionReference org_friendsCollection;

  OrgDatabaseService(this.uid) {
    organizationCollection =
        FirebaseFirestore.instance.collection('Organizations');
    org_eventsCollection = organizationCollection.doc(uid).collection('Events');
    org_messagesCollection =
        organizationCollection.doc(uid).collection('Messages');
    org_friendsCollection =
        organizationCollection.doc(uid).collection('Orgnaization Friends');
  }

  String? get id => null;

  Future updateOrganizationData(String orgName, String orgEmail, String descrip,
      String profilePic) async {
    return await organizationCollection.doc(uid).set({
      'Organizaton Name': orgName,
      'Organization Email': orgEmail,
      'Description': descrip,
      'Profile Pictire': profilePic,
    });
  }

  Future addEvents(String evName, String orgName, String descrip,
      String location, String time, String poster) async {
    await org_eventsCollection.add({
      'Event Name': evName,
      'Organization': orgName,
      'Description': descrip,
      'Location': location,
      'Time': time,
      'Poster Link': poster,
    });

    await DatabaseService(uid)
        .updateEventData(evName, orgName, descrip, location, time, poster);
  }

  Future addMessages(
      String sender, String reciever, String message, String timeStamp) async {
    await org_messagesCollection.add({
      'Sender User': sender,
      'Reciever User': reciever,
      'Message': message,
      'Time Stamp': timeStamp,
    });
  }

  Future addOrgFriends(String friendsDoc) async {
    await org_friendsCollection.add({
      'FriendsDoc': friendsDoc,
    });
  }
}
