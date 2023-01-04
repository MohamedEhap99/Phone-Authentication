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
    apiKey: 'AIzaSyD6v6iqrO8rbhvHaAcNWe-gELT06TercCY',
    appId: '1:444663264433:web:300d65096c2188f0429e90',
    messagingSenderId: '444663264433',
    projectId: 'test-phone-auth-4f100',
    authDomain: 'test-phone-auth-4f100.firebaseapp.com',
    storageBucket: 'test-phone-auth-4f100.appspot.com',
    measurementId: 'G-1VJPQWBRCS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5qaQvMY61qxrR24QMl1uqeFo1M8syHwU',
    appId: '1:444663264433:android:95476a4f7d363258429e90',
    messagingSenderId: '444663264433',
    projectId: 'test-phone-auth-4f100',
    storageBucket: 'test-phone-auth-4f100.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4e5z2LXzz_CeiE2dA0iODnQDzLgImGG4',
    appId: '1:444663264433:ios:068cd8ff1d1be480429e90',
    messagingSenderId: '444663264433',
    projectId: 'test-phone-auth-4f100',
    storageBucket: 'test-phone-auth-4f100.appspot.com',
    iosClientId: '444663264433-10qor9vlqee51n4lptrp1iedephdebkm.apps.googleusercontent.com',
    iosBundleId: 'com.example.testPhoneAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4e5z2LXzz_CeiE2dA0iODnQDzLgImGG4',
    appId: '1:444663264433:ios:068cd8ff1d1be480429e90',
    messagingSenderId: '444663264433',
    projectId: 'test-phone-auth-4f100',
    storageBucket: 'test-phone-auth-4f100.appspot.com',
    iosClientId: '444663264433-10qor9vlqee51n4lptrp1iedephdebkm.apps.googleusercontent.com',
    iosBundleId: 'com.example.testPhoneAuth',
  );
}
