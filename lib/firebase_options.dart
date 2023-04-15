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
    apiKey: 'AIzaSyA9e058LgfaK9SkKMarjKfiEVVaUh1R5Uw',
    appId: '1:766096269533:web:7a643adde4f234f4f0bb34',
    messagingSenderId: '766096269533',
    projectId: 'support-stress-free',
    authDomain: 'support-stress-free.firebaseapp.com',
    databaseURL: 'https://support-stress-free-default-rtdb.firebaseio.com',
    storageBucket: 'support-stress-free.appspot.com',
    measurementId: 'G-EX6HFSCGB1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwioUg6DdCbxf_V5wWmXYaEI1bZwr7nUY',
    appId: '1:766096269533:android:a5b1e49076aaf5b9f0bb34',
    messagingSenderId: '766096269533',
    projectId: 'support-stress-free',
    databaseURL: 'https://support-stress-free-default-rtdb.firebaseio.com',
    storageBucket: 'support-stress-free.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBR2TkW3k5Ht349qJJEKmnwW8jQnA28KXY',
    appId: '1:766096269533:ios:f83102d4acedba94f0bb34',
    messagingSenderId: '766096269533',
    projectId: 'support-stress-free',
    databaseURL: 'https://support-stress-free-default-rtdb.firebaseio.com',
    storageBucket: 'support-stress-free.appspot.com',
    androidClientId: '766096269533-1l3b43ggb6bkhggj48tm0uj2dk66sr8v.apps.googleusercontent.com',
    iosClientId: '766096269533-5nutema9ube154cschibpkg52bl4b3mh.apps.googleusercontent.com',
    iosBundleId: 'com.example.support',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBR2TkW3k5Ht349qJJEKmnwW8jQnA28KXY',
    appId: '1:766096269533:ios:f83102d4acedba94f0bb34',
    messagingSenderId: '766096269533',
    projectId: 'support-stress-free',
    databaseURL: 'https://support-stress-free-default-rtdb.firebaseio.com',
    storageBucket: 'support-stress-free.appspot.com',
    androidClientId: '766096269533-1l3b43ggb6bkhggj48tm0uj2dk66sr8v.apps.googleusercontent.com',
    iosClientId: '766096269533-5nutema9ube154cschibpkg52bl4b3mh.apps.googleusercontent.com',
    iosBundleId: 'com.example.support',
  );
}
