import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future updateOrganizationData(String orgName, String orgEmail, String descrip,
      String profilePic) async {
    return await organizationCollection.doc(uid).set({
      'Organizaton Name': orgName,
      'Organization Email': orgEmail,
      'Description': descrip,
      'Profile Pictire': profilePic,
    });
  }

  Future addEvents(
      String eventName, String description, String profPicEvent) async {
    await org_eventsCollection.add({
      'Event Name': eventName,
      'Description': description,
      'Pofile Picture': profPicEvent,
    });
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
    await org_eventsCollection.add({
      'FriendsDoc': friendsDoc,
    });
  }
}
