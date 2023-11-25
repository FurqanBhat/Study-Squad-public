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
    apiKey: 'AIzaSyBzWULQqFtSfitGoI40cYeaBGRQWoXxChg',
    appId: '1:1042053211991:web:972c9f4b470ae1a3474012',
    messagingSenderId: '1042053211991',
    projectId: 'study-squad-3d4fa',
    authDomain: 'study-squad-3d4fa.firebaseapp.com',
    storageBucket: 'study-squad-3d4fa.appspot.com',
    measurementId: 'G-B2KBVX799G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6-gfurm_BqYMU99JwJoZAQcFhYOdJMRU',
    appId: '1:1042053211991:android:df457f5ac5f6c03d474012',
    messagingSenderId: '1042053211991',
    projectId: 'study-squad-3d4fa',
    storageBucket: 'study-squad-3d4fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxq9ZndZ2EM0IO2dFLr9oLhfPedcxew1Y',
    appId: '1:1042053211991:ios:02444a7a62147d9c474012',
    messagingSenderId: '1042053211991',
    projectId: 'study-squad-3d4fa',
    storageBucket: 'study-squad-3d4fa.appspot.com',
    iosBundleId: 'agu.devs.studySquad',
  );
}