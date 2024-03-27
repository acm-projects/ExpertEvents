// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDETWQoioLp4Db5Io5UOMHYDXuII5Lwi6Q',
    appId: '1:871374619509:web:0f4b1b1f0b3bbe1d41893c',
    messagingSenderId: '871374619509',
    projectId: 'expertevents-7bbc6',
    authDomain: 'expertevents-7bbc6.firebaseapp.com',
    storageBucket: 'expertevents-7bbc6.appspot.com',
    measurementId: 'G-VF7EVZYBFH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfW6SZdaeLIxdIFbr67zZtPMnWrF2GoPE',
    appId: '1:871374619509:android:ea912bde4da8a23441893c',
    messagingSenderId: '871374619509',
    projectId: 'expertevents-7bbc6',
    storageBucket: 'expertevents-7bbc6.appspot.com',
  );
}