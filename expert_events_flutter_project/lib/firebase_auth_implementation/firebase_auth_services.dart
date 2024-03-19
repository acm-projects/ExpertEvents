import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import '../../global/common/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService{

    FirebaseAuth _auth = FirebaseAuth.instance;
    
    //User sign up
    Future<User?> signUpWithEmailAndPassword(String email, String password) async {
        
        try{
            UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            return credential.user;

        } on FirebaseAuthException catch (e) {
            print(e.code);

            // Shows the issue with the entered password on the users screen as a small message, this isn't working tho
            // if (e.code == 'email-already-in-use'){
            //     showToast(message: 'The email address is already in use.');
            // } else {
            //     showToast(message: 'An error occured: ${e.code}');
            // }

        }
        return null;
    }
    
    //User sign in
    Future<User?> signInWithEmailAndPassword(String email, String password) async {
        
        try{
            UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
            return credential.user;

        } on FirebaseAuthException catch (e) {
            print (e.code);

            //Again, shows issue with password on users screen, but the frontend code isn't working
            // if (e.code == 'user-not-found' || e.code == 'wrong-password') { 
            //     showToast(message: 'Invalid email or password.');
            // } else {
            //     showToast(message: 'An error occurred: ${e.code}');
            // }
        }
        return null;
    }

    //Method that gives the list of all existing users (including their info in the database)
    Future<List<Map<String, dynamic>>> getUsers() async {
        // Access the Firestore collection containing users
        CollectionReference<Map<String, dynamic>> 
            userCollection = FirebaseFirestore.instance.collection('Users');

        // Retrieve all documents (users) from the collection
        QuerySnapshot<Map<String, dynamic>> 
            querySnapshot = await userCollection.get();

        // Extract user data from QuerySnapshot and convert to List
        List<Map<String, dynamic>> users = [];
        querySnapshot.docs.forEach((doc) {
            users.add(doc.data());
        });

        print(users);
        return users;
    }
    //Here is the code to call this above function, this gives the users list 
    //List<Map<String, dynamic>>? users = await _auth.getUsers() ?? null;
    String getUserID() {
    String userID = '';
    User? user = _auth.currentUser;
        if (user != null) {
            userID = user.uid; //retrives userID of logged in user
        }
    return userID;
    }
}

 




