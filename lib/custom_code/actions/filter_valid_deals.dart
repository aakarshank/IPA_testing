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

Future<List<String>> filterValidDeals() async {
  try {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the current user reference
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }

    // Optimized query to directly utilize the indexed fields
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(
            'Deals') // Make sure to use the correct capitalization as per your collection name
        .where('end_moment', isGreaterThan: Timestamp.fromDate(now))
        .where('available_redemptions', isGreaterThan: 0)
        .get();

    // Map the documents to their IDs
    List<String> validDealIds =
        querySnapshot.docs.map((doc) => doc.id).toList();

    return validDealIds;
  } catch (e) {
    print('Error filtering deals: $e');
    return [];
  }
}
