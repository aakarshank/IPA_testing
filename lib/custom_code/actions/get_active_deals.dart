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

Future<List<dynamic>> getActiveDeals() async {
  try {
    DateTime now = DateTime.now();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      print("No current user logged in.");
      return [];
    }

    final currentUserDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser.uid)
        .get();
    final displayName = currentUserDoc.data()?['display_name'] as String?;

    if (displayName == null) {
      print("Current user does not have a display name set.");
      return [];
    }

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Deals')
        .where('business_name', isEqualTo: displayName)
        .orderBy('end_moment', descending: false)
        .orderBy('available_redemptions', descending: false)
        .get();

    List<dynamic> activeDeals = querySnapshot.docs
        .where((doc) {
          final data = doc.data() as Map<String, dynamic>? ?? {};
          DateTime? endDate = (data['end_moment'] as Timestamp?)?.toDate();
          int availableRedemptions = data['available_redemptions'] ?? 0;
          return endDate != null &&
              endDate.isAfter(now) &&
              availableRedemptions > 0;
        })
        .map(
            (doc) => {'deal_id': doc.id, ...doc.data() as Map<String, dynamic>})
        .toList();

    return activeDeals;
  } catch (e) {
    print('Error filtering deals: $e');
    return [];
  }
}
