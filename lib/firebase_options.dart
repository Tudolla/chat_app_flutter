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
    apiKey: 'AIzaSyAf4aHIzWxy21UYSw3Qtw1fUfT-OYFngDQ',
    appId: '1:1096759998416:web:90bddf28efd6d4a9c7abd5',
    messagingSenderId: '1096759998416',
    projectId: 'chat-app-flutter-a5be9',
    authDomain: 'chat-app-flutter-a5be9.firebaseapp.com',
    storageBucket: 'chat-app-flutter-a5be9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBr3Miq8uZh-A2jh0mk5ZpnD13_C6ahM3o',
    appId: '1:1096759998416:android:8c2410f970ff074bc7abd5',
    messagingSenderId: '1096759998416',
    projectId: 'chat-app-flutter-a5be9',
    storageBucket: 'chat-app-flutter-a5be9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXSDtAYvdqMwR_np7hV3-MM3nnm1YP5ts',
    appId: '1:1096759998416:ios:99510ebde2a97a16c7abd5',
    messagingSenderId: '1096759998416',
    projectId: 'chat-app-flutter-a5be9',
    storageBucket: 'chat-app-flutter-a5be9.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXSDtAYvdqMwR_np7hV3-MM3nnm1YP5ts',
    appId: '1:1096759998416:ios:99510ebde2a97a16c7abd5',
    messagingSenderId: '1096759998416',
    projectId: 'chat-app-flutter-a5be9',
    storageBucket: 'chat-app-flutter-a5be9.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAf4aHIzWxy21UYSw3Qtw1fUfT-OYFngDQ',
    appId: '1:1096759998416:web:3e6ca2e58056a396c7abd5',
    messagingSenderId: '1096759998416',
    projectId: 'chat-app-flutter-a5be9',
    authDomain: 'chat-app-flutter-a5be9.firebaseapp.com',
    storageBucket: 'chat-app-flutter-a5be9.appspot.com',
  );

}