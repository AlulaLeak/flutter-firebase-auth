import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAQAEQJuqBmNmYe8uwDBapmKIPnHngaIdc',
    appId: '1:541592769303:web:6e8d1148d58c75ce9c9d52',
    messagingSenderId: '541592769303',
    projectId: 'auth-test-setup',
    authDomain: 'auth-test-setup.firebaseapp.com',
    storageBucket: 'auth-test-setup.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQm9-olJaZ3QcZ0WbopZqxLxVqbUneKiI',
    appId: '1:541592769303:android:c9961134bc0402929c9d52',
    messagingSenderId: '541592769303',
    projectId: 'auth-test-setup',
    storageBucket: 'auth-test-setup.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPa3YOdhfIrF0B8BOkoNxOfj2DqiawG_Q',
    appId: '1:541592769303:ios:a000f7ebd2ac9f149c9d52',
    messagingSenderId: '541592769303',
    projectId: 'auth-test-setup',
    storageBucket: 'auth-test-setup.appspot.com',
    iosClientId:
        '541592769303-qk3dt3urs2i62ddm0muuvbc4crktrjs5.apps.googleusercontent.com',
    iosBundleId: 'com.testapp.fireflutter',
  );
}
