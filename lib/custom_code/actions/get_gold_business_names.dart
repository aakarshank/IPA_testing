// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//gpt3.5

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<String>> getGoldBusinessNames() async {
  User? user = FirebaseAuth.instance.currentUser;
  List<String> eligibleBusinessNames = [];

  if (user == null) {
    print("No user logged in.");
    return [];
  }

  try {
    CollectionReference loyaltyCollection = FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('Loyalty');

    QuerySnapshot loyaltySnapshot = await loyaltyCollection.get();

    for (QueryDocumentSnapshot doc in loyaltySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      int numRedeemedThere = data['numRedeemedThere'] ?? 0;
      int goldMin = data['goldMin'] ?? 0;

      if (numRedeemedThere >= goldMin) {
        eligibleBusinessNames.add(data['businessName']);
      }
    }
  } catch (e) {
    print('Error retrieving gold businesses: $e');
    return []; // Optionally return an empty list on error or rethrow the exception depending on your error handling policy.
  }

  return eligibleBusinessNames;
}
// End custom action code
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
