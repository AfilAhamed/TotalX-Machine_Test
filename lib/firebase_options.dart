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
    apiKey: 'AIzaSyCfO8Q9hDaOPDbjQc8zcjTvZxJgsDZv6yA',
    appId: '1:749897280636:web:fd92f8f3542db558b7adf9',
    messagingSenderId: '749897280636',
    projectId: 'todo-list-3d3e2',
    authDomain: 'todo-list-3d3e2.firebaseapp.com',
    storageBucket: 'todo-list-3d3e2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVcUGbhl1i8zcFUOXHrXU7xKwNlszl7-U',
    appId: '1:749897280636:android:20e05167b76b5636b7adf9',
    messagingSenderId: '749897280636',
    projectId: 'todo-list-3d3e2',
    storageBucket: 'todo-list-3d3e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIlF1VH4pFQm7E3N1jd7SzEsjKgin4YG8',
    appId: '1:749897280636:ios:add2e8a33889bb78b7adf9',
    messagingSenderId: '749897280636',
    projectId: 'todo-list-3d3e2',
    storageBucket: 'todo-list-3d3e2.appspot.com',
    iosBundleId: 'com.example.todoListApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIlF1VH4pFQm7E3N1jd7SzEsjKgin4YG8',
    appId: '1:749897280636:ios:add2e8a33889bb78b7adf9',
    messagingSenderId: '749897280636',
    projectId: 'todo-list-3d3e2',
    storageBucket: 'todo-list-3d3e2.appspot.com',
    iosBundleId: 'com.example.todoListApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCfO8Q9hDaOPDbjQc8zcjTvZxJgsDZv6yA',
    appId: '1:749897280636:web:ae9be606df205d09b7adf9',
    messagingSenderId: '749897280636',
    projectId: 'todo-list-3d3e2',
    authDomain: 'todo-list-3d3e2.firebaseapp.com',
    storageBucket: 'todo-list-3d3e2.appspot.com',
  );
}
