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
    apiKey: 'AIzaSyDXucSPKsRzFD5dHV49FfpxEFSTraFJdFI',
    appId: '1:169702996601:web:c03cb695873b3cf09c72a8',
    messagingSenderId: '169702996601',
    projectId: 'cheatapp-16818',
    authDomain: 'cheatapp-16818.firebaseapp.com',
    storageBucket: 'cheatapp-16818.appspot.com',
    measurementId: 'G-PDT7T0RJQE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2EXnMRKPTe9FF1XuPbk8GSGiThjzALl8',
    appId: '1:169702996601:android:35d280594d127d7b9c72a8',
    messagingSenderId: '169702996601',
    projectId: 'cheatapp-16818',
    storageBucket: 'cheatapp-16818.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPPMO6YzSKUhWfbIV1cxYDcHp07Bw-s8k',
    appId: '1:169702996601:ios:8a4ef0484a0554d09c72a8',
    messagingSenderId: '169702996601',
    projectId: 'cheatapp-16818',
    storageBucket: 'cheatapp-16818.appspot.com',
    iosBundleId: 'com.example.cheatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPPMO6YzSKUhWfbIV1cxYDcHp07Bw-s8k',
    appId: '1:169702996601:ios:8a4ef0484a0554d09c72a8',
    messagingSenderId: '169702996601',
    projectId: 'cheatapp-16818',
    storageBucket: 'cheatapp-16818.appspot.com',
    iosBundleId: 'com.example.cheatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXucSPKsRzFD5dHV49FfpxEFSTraFJdFI',
    appId: '1:169702996601:web:11a55eea9b559a0e9c72a8',
    messagingSenderId: '169702996601',
    projectId: 'cheatapp-16818',
    authDomain: 'cheatapp-16818.firebaseapp.com',
    storageBucket: 'cheatapp-16818.appspot.com',
    measurementId: 'G-YQVN7NL66J',
  );
}
