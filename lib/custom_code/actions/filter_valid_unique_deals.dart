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

Future<List<String>> filterValidUniqueDeals() async {
  try {
    DateTime now = DateTime.now();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return []; // Return an empty list if no user is logged in
    }
    final currentUserUid = currentUser.uid;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('deals')
        .where('end_moment', isGreaterThan: now)
        .get();

    List<String> validDealIds = querySnapshot.docs
        .where((doc) {
          final data = doc.data() as Map<String, dynamic>? ?? {};
          DateTime? endDate = (data['end_moment'] as Timestamp?)?.toDate();
          int availableRedemptions = data['available_redemptions'] ?? 0;
          List<dynamic> redeemedBy = data['redeemed_by'] ?? [];
          List<String> uniqueTo = List<String>.from(data['unique_to'] ?? []);

          return endDate != null &&
              endDate.isAfter(now) &&
              availableRedemptions > 0 &&
              !redeemedBy.contains(currentUserUid) &&
              uniqueTo.contains(currentUserUid);
        })
        .map((doc) => doc.id)
        .toList();

    return validDealIds;
  } catch (e) {
    print('Error filtering deals: $e');
    return [];
  }
}
