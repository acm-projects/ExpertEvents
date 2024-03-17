import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';


const String MESSAGES_COLLECTON_REF = "UserMessages";

class MessagesService {
  final firestore = FirebaseFirestore.instance;

  late final CollectionReference messagesRef;
  late final CollectionReference userCollection;
  
  MessagesService() {
    userCollection = FirebaseFirestore.instance.collection('Users');
    final FirebaseAuthService _auth = FirebaseAuthService();
    String uID = _auth.getUserID();

    messagesRef = userCollection.doc(uID).collection(MESSAGES_COLLECTON_REF).withConverter<Message1>(
        fromFirestore: (snapshots, _) => Message1.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (message, _) => message.toJson());
  }

  //retrives messages from the database
  Stream<QuerySnapshot> getMessages() {
    return messagesRef.snapshots();
  }

  //adds messages to the database
  void addMessages(Message1 message) async {
    messagesRef.add(message);
  }

  //deletes message from the database using the messageID
  void deleteMessage(String messageID) {
    messagesRef.doc(messageID).delete();
  }
}
