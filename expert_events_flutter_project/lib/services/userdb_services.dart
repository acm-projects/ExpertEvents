import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import '../models/userFriends.dart';


class UsersService {
  final firestore = FirebaseFirestore.instance;

  late final CollectionReference usersRef;
  late final CollectionReference friendsRef;
  late final CollectionReference userCollection;
  late final CollectionReference userEventsCollection;
  late final CollectionReference userOrganizationsCollection;
  late final CollectionReference userFriendsCollection;
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

    friendsRef = userFriendsCollection.withConverter<Friend>(
        fromFirestore: (snapshots, _) => Friend.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (friend, _) => friend.toJson());
  }

  //retrives all users from the database
  Stream<QuerySnapshot> getUsers() {
    //print(usersRef.snapshots());
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

    //gets user info of one specific user by using their id
  Stream<User1?> getUserById(String userId) {
    return usersRef.doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return snapshot.data() as User1;
      } else {
        return null;
      }
    });
  }


    //adds event to user's userEvents database
    Future addEvent( String eventId) async{
        await userEventsCollection.add({
            'ID': eventId,
        });
    }


    //get user's friends's ids from database
  Stream<QuerySnapshot> getFriendsIds() {
    //print(usersRef.snapshots());
    return friendsRef.snapshots();
  }

  //gets the user's friends' data using the logged in user's id
    Stream<List<User1>> getFriends(String userId) {
  return getUsersById(userId).asyncMap((user) async {
    if (user == null) {
      return <User1>[];
    }
    final List<User1> friends = [];
    final QuerySnapshot friendIdsSnapshot = await userFriendsCollection.get();
    final List<String> friendIds = friendIdsSnapshot.docs.map((doc) => doc['ID'] as String).toList();
    for (final id in friendIds) {
      final friend = await getUserById(id)?.first;
      if (friend != null) {
        friends.add(friend);
      }
    }
    return friends;
  });
} 

    //adds user to user's userFriends database (change based on what info of friend is passed in friendsList)
    Future addFriend( String friendsId) async{
        await userFriendsCollection.add({
            'ID': friendsId,
        });
    }

    //get user events from database
}
