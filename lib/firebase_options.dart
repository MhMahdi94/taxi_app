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
    apiKey: 'AIzaSyDntZW0CHi60_l1LF4lzTruSyVTIq7zVKc',
    appId: '1:771059755421:web:08d4cca06207b411c32774',
    messagingSenderId: '771059755421',
    projectId: 'taxi-app-e2966',
    authDomain: 'taxi-app-e2966.firebaseapp.com',
    storageBucket: 'taxi-app-e2966.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUzcGFOaKhsZa3lCR53eJ70VZVb28MauY',
    appId: '1:771059755421:android:98c9449ae25c0887c32774',
    messagingSenderId: '771059755421',
    projectId: 'taxi-app-e2966',
    storageBucket: 'taxi-app-e2966.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6Ge_0jwSG91W-C2QVVtfmIRC6nJ682Fk',
    appId: '1:771059755421:ios:62b8e0379f440402c32774',
    messagingSenderId: '771059755421',
    projectId: 'taxi-app-e2966',
    storageBucket: 'taxi-app-e2966.appspot.com',
    iosClientId: '771059755421-1kkr61cscn66nvukvs98p4b9rpvstal1.apps.googleusercontent.com',
    iosBundleId: 'com.example.taxiApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6Ge_0jwSG91W-C2QVVtfmIRC6nJ682Fk',
    appId: '1:771059755421:ios:62b8e0379f440402c32774',
    messagingSenderId: '771059755421',
    projectId: 'taxi-app-e2966',
    storageBucket: 'taxi-app-e2966.appspot.com',
    iosClientId: '771059755421-1kkr61cscn66nvukvs98p4b9rpvstal1.apps.googleusercontent.com',
    iosBundleId: 'com.example.taxiApplication',
  );
}
