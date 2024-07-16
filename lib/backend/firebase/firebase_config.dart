import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCrTy5xfk0Xv7LIegCq1DKPS5ENlOz7y08",
            authDomain: "redemlypagebypage.firebaseapp.com",
            projectId: "redemlypagebypage",
            storageBucket: "redemlypagebypage.appspot.com",
            messagingSenderId: "316792930526",
            appId: "1:316792930526:web:4b3ba8537dc0559165c24f",
            measurementId: "G-287CP60DVG"));
  } else {
    await Firebase.initializeApp();
  }
}
