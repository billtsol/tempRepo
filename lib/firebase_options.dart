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
    apiKey: 'AIzaSyBbh8w30ic8nrzf1hZnoWcIn9NbvpUOhoY',
    appId: '1:360246932300:web:62bfcfeee3a7bdc53495e9',
    messagingSenderId: '360246932300',
    projectId: 'interview-app1',
    authDomain: 'interview-app1.firebaseapp.com',
    storageBucket: 'interview-app1.firebasestorage.app',
    measurementId: 'G-1LJJG12QS4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVi276ElKUt9z4xMawtnFPEQoFQiMdaS0',
    appId: '1:360246932300:android:7204e9a691f54e1f3495e9',
    messagingSenderId: '360246932300',
    projectId: 'interview-app1',
    storageBucket: 'interview-app1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzhCfmyzTGN87jUQ45duyJn4rvEQb6hyw',
    appId: '1:360246932300:ios:cf44df667212e3083495e9',
    messagingSenderId: '360246932300',
    projectId: 'interview-app1',
    storageBucket: 'interview-app1.firebasestorage.app',
    iosBundleId: 'com.example.flutterInterview1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzhCfmyzTGN87jUQ45duyJn4rvEQb6hyw',
    appId: '1:360246932300:ios:cf44df667212e3083495e9',
    messagingSenderId: '360246932300',
    projectId: 'interview-app1',
    storageBucket: 'interview-app1.firebasestorage.app',
    iosBundleId: 'com.example.flutterInterview1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbh8w30ic8nrzf1hZnoWcIn9NbvpUOhoY',
    appId: '1:360246932300:web:6033c8d11fe15b953495e9',
    messagingSenderId: '360246932300',
    projectId: 'interview-app1',
    authDomain: 'interview-app1.firebaseapp.com',
    storageBucket: 'interview-app1.firebasestorage.app',
    measurementId: 'G-B3359Q5HSM',
  );
}