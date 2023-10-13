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
    apiKey: 'AIzaSyD7UxpPda2LNSYVJeg-Tn9UZmOWCi-AIYQ',
    appId: '1:467713849040:web:9baa1fca6a5fd887ad10d5',
    messagingSenderId: '467713849040',
    projectId: 'getparked-bad64',
    authDomain: 'getparked-bad64.firebaseapp.com',
    storageBucket: 'getparked-bad64.appspot.com',
    measurementId: 'G-2PBHF3NWMP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAd063URLgZjAijuUdavBGkoDm3nUugnvE',
    appId: '1:467713849040:android:0bceaff46d7b4031ad10d5',
    messagingSenderId: '467713849040',
    projectId: 'getparked-bad64',
    storageBucket: 'getparked-bad64.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtGQRRHXsixsG3O2P6m1gEtHUczf6dX6I',
    appId: '1:467713849040:ios:c0dc8f1e8df63da6ad10d5',
    messagingSenderId: '467713849040',
    projectId: 'getparked-bad64',
    storageBucket: 'getparked-bad64.appspot.com',
    iosBundleId: 'com.example.getParked',
  );
}