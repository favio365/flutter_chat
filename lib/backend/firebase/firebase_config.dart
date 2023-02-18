import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDZ6IQmcAvikaHp2bLANNL0wq2e6NO-1LA",
            authDomain: "chat-8b91c.firebaseapp.com",
            projectId: "chat-8b91c",
            storageBucket: "chat-8b91c.appspot.com",
            messagingSenderId: "744707501676",
            appId: "1:744707501676:web:d3e4fd61fc02eceaf03249",
            measurementId: "G-F8VRY5QPZH"));
  } else {
    await Firebase.initializeApp();
  }
}
