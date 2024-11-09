// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCbuJe-ezzh8q5cl4gZ6dFYKBMOVVlhgOY',
    appId: '1:976674345292:web:02feb7004b00a82a52ffe9',
    messagingSenderId: '976674345292',
    projectId: 'visionary-journey-app',
    authDomain: 'visionary-journey-app.firebaseapp.com',
    storageBucket: 'visionary-journey-app.firebasestorage.app',
    measurementId: 'G-QRZZ2TEHC6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjrFDyIqcvSwW2wRSmlA7n_N-PHhso98c',
    appId: '1:976674345292:android:9b20b3dbc285708d52ffe9',
    messagingSenderId: '976674345292',
    projectId: 'visionary-journey-app',
    storageBucket: 'visionary-journey-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACh187AS1iO_AzlMQNqJlNG09iYNTycRs',
    appId: '1:976674345292:ios:c3721c70f1e4cfab52ffe9',
    messagingSenderId: '976674345292',
    projectId: 'visionary-journey-app',
    storageBucket: 'visionary-journey-app.firebasestorage.app',
    iosBundleId: 'com.example.visionaryJourneyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACh187AS1iO_AzlMQNqJlNG09iYNTycRs',
    appId: '1:976674345292:ios:c3721c70f1e4cfab52ffe9',
    messagingSenderId: '976674345292',
    projectId: 'visionary-journey-app',
    storageBucket: 'visionary-journey-app.firebasestorage.app',
    iosBundleId: 'com.example.visionaryJourneyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbuJe-ezzh8q5cl4gZ6dFYKBMOVVlhgOY',
    appId: '1:976674345292:web:f71fbfb8d3823a5c52ffe9',
    messagingSenderId: '976674345292',
    projectId: 'visionary-journey-app',
    authDomain: 'visionary-journey-app.firebaseapp.com',
    storageBucket: 'visionary-journey-app.firebasestorage.app',
    measurementId: 'G-6MDS0XEMXB',
  );

}