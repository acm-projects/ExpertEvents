import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import '../../global/common/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

            //Again, shows issue with password on users screen, but the frontend isn't working
            // if (e.code == 'user-not-found' || e.code == 'wrong-password') { 
            //     showToast(message: 'Invalid email or password.');
            // } else {
            //     showToast(message: 'An error occurred: ${e.code}');
            // }
        }
        return null;
    }

}

//SIGN IN WITH GOOGLE 

// _signInWithGoogle()async{

//     final GoogleSignIn _googleSignIn = GoogleSignIn();

//     try {

//       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

//       if(googleSignInAccount != null ){
//         final GoogleSignInAuthentication googleSignInAuthentication = await
//         googleSignInAccount.authentication;

//         final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );

//         await _firebaseAuth.signInWithCredential(credential);
//         Navigator.pushNamed(context, "/home");
//       }

//     }catch(e) {
// showToast(message: "some error occured $e");
//     }


//   }
