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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyDuK8XtjL4qvxuXVJHVJV60QlBwc6sl_to',
    appId: '1:587242579236:web:62889f87d869995ab53fb1',
    messagingSenderId: '587242579236',
    projectId: 'sliittodolistapp',
    authDomain: 'sliittodolistapp.firebaseapp.com',
    storageBucket: 'sliittodolistapp.appspot.com',
    measurementId: 'G-NED00SSFGL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBznx0FUbuS5OulX3iJ1wUQMdanTQdg75M',
    appId: '1:587242579236:android:ddf82e57ef220f14b53fb1',
    messagingSenderId: '587242579236',
    projectId: 'sliittodolistapp',
    storageBucket: 'sliittodolistapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-Em2rFS5bFg1qv8PGwWkNjxmvm2yqItE',
    appId: '1:587242579236:ios:3bfa438f30e5a90ab53fb1',
    messagingSenderId: '587242579236',
    projectId: 'sliittodolistapp',
    storageBucket: 'sliittodolistapp.appspot.com',
    iosClientId: '587242579236-rrb941cjo1u3h6ale63932sedn8b64e3.apps.googleusercontent.com',
    iosBundleId: 'com.example.sliittodolistapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-Em2rFS5bFg1qv8PGwWkNjxmvm2yqItE',
    appId: '1:587242579236:ios:3bfa438f30e5a90ab53fb1',
    messagingSenderId: '587242579236',
    projectId: 'sliittodolistapp',
    storageBucket: 'sliittodolistapp.appspot.com',
    iosClientId: '587242579236-rrb941cjo1u3h6ale63932sedn8b64e3.apps.googleusercontent.com',
    iosBundleId: 'com.example.sliittodolistapp',
  );
}
