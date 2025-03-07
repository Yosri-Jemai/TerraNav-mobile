import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCcpaepXfa5ol32kR4PnHDPB-xIuxRPkSc",
            authDomain: "groupe-64orj9.firebaseapp.com",
            projectId: "groupe-64orj9",
            storageBucket: "groupe-64orj9.firebasestorage.app",
            messagingSenderId: "778836916923",
            appId: "1:778836916923:web:25a4fcfa9b1f031631879e"));
  } else {
    await Firebase.initializeApp();
  }
}
