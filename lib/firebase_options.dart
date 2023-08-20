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
    apiKey: 'AIzaSyA8gyD7v5GiAyza3mbX0e75Jy_G5SZzaco',
    appId: '1:517623258175:web:11966eed897f1765776c8a',
    messagingSenderId: '517623258175',
    projectId: 'shopping-app-a644e',
    authDomain: 'shopping-app-a644e.firebaseapp.com',
    storageBucket: 'shopping-app-a644e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqEaIDyCt0ZJUEhuZGN2JBn270VFq3q0E',
    appId: '1:517623258175:android:cb008cc1e7ee1556776c8a',
    messagingSenderId: '517623258175',
    projectId: 'shopping-app-a644e',
    storageBucket: 'shopping-app-a644e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXaE8nsD3h5cZCA6mz4zST_45TtLSoxwY',
    appId: '1:517623258175:ios:a5c253e8d13a0991776c8a',
    messagingSenderId: '517623258175',
    projectId: 'shopping-app-a644e',
    storageBucket: 'shopping-app-a644e.appspot.com',
    iosClientId: '517623258175-jm86j26atrpoquv14slkicvmjfi9m21q.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXaE8nsD3h5cZCA6mz4zST_45TtLSoxwY',
    appId: '1:517623258175:ios:9d4761891adeff63776c8a',
    messagingSenderId: '517623258175',
    projectId: 'shopping-app-a644e',
    storageBucket: 'shopping-app-a644e.appspot.com',
    iosClientId: '517623258175-9etbih01kcrp3go6btd9a1ct4r4pps0a.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp.RunnerTests',
  );
}