// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<String>> filterValidBirthdayDeals() async {
  try {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the current user reference
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }
    final currentUserReference =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

    // Query the Deals collection using the index
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Deals') // Ensure you use the correct capitalization
        .where('end_moment', isGreaterThan: Timestamp.fromDate(now))
        .where('available_redemptions', isGreaterThan: 0)
        .where('deal_tier', isEqualTo: 'Birthday')
        .get();

    // Additional client-side filter for 'redeemed_by' if necessary
    List<String> validDealIds = querySnapshot.docs
        .where((doc) {
          final data = doc.data() as Map<String, dynamic>? ?? {};
          List<dynamic> redeemedBy = data['redeemed_by'] ?? [];
          return !redeemedBy.contains(currentUserReference);
        })
        .map((doc) => doc.id)
        .toList();

    return validDealIds; // Return list of valid deal IDs
  } catch (e) {
    print('Error filtering birthday deals: $e'); // Print error message
    return []; // Return empty list on error
  }
}
