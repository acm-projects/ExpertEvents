import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';


class UsersService {
  final firestore = FirebaseFirestore.instance;

  late final CollectionReference usersRef;
  late final CollectionReference userCollection;
  late CollectionReference userEventsCollection;
  late CollectionReference userOrganizationsCollection;
  late CollectionReference userFriendsCollection;
  String uID='';

  UsersService() {
    userCollection = FirebaseFirestore.instance.collection('Users');
    final FirebaseAuthService _auth = FirebaseAuthService();
    uID = _auth.getUserID();

    userEventsCollection = userCollection.doc(uID).collection('UserEvents');
    userOrganizationsCollection = userCollection.doc(uID).collection('UserOrganizations');
    userFriendsCollection = userCollection.doc(uID).collection('UserFriends');

    usersRef = userCollection.withConverter<User1>(
        fromFirestore: (snapshots, _) => User1.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (user, _) => user.toJson());
  }

  //retrives all users from the database
  Stream<QuerySnapshot> getUsers() {
    return usersRef.snapshots();
  }

  //adds user to the database
  void addUser(User1 user) async {
    usersRef.add(user);
  }

  //deletes users from the database using the userID
  void deleteUser(String userID) {
    usersRef.doc(userID).delete();
  }

    //adds event to user's userEvents database
    Future addEvent(String eventId) async{
        await userEventsCollection.add({
            'ID': eventId,
        });
    }

    //get user friends from database

    //adds user to user's userFriends database
    Future addFriend(String friendName, String friendsId) async{
        await userFriendsCollection.add({
            'Name': friendName,
            'ID': friendsId,
        });
    }

    //get user events from database
}
