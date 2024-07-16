// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:cloud_firestore/cloud_firestore.dart'; // Import FirebaseFirestore

// Action name: UpdateLoyaltyGoldMin
// Arguments: int newGoldMin
Future<void> updateGoldMin(int newGoldMin) async {
  final currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null) {
    print('No authenticated user found.');
    return;
  }

  final businessName = currentUser.displayName;

  // Check if businessName is not null
  if (businessName == null) {
    print('Authenticated user does not have a display name.');
    return;
  }

  // Query all Users collection
  final usersQuerySnapshot =
      await FirebaseFirestore.instance.collection('Users').get();

  for (var userDoc in usersQuerySnapshot.docs) {
    // Get the Loyalty subcollection
    final loyaltyCollectionRef = userDoc.reference.collection('Loyalty');

    // Query Loyalty subcollection for documents where businessName equals authenticated user's name
    final loyaltyQuerySnapshot = await loyaltyCollectionRef
        .where('businessName', isEqualTo: businessName)
        .get();

    for (var loyaltyDoc in loyaltyQuerySnapshot.docs) {
      // Update the goldMin field
      await loyaltyDoc.reference.update({'goldMin': newGoldMin});
    }
  }
}
