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

Future<List<String>> filterValidTrendingDeals() async {
  try {
    DateTime now = DateTime.now();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return []; // Return an empty list if the user is not logged in
    }
    final currentUserReference =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('deals').get();

    List<Map<String, dynamic>> validDeals = querySnapshot.docs
        .where((doc) {
          final data = doc.data() as Map<String, dynamic>? ?? {};
          DateTime? endDate = (data['end_moment'] as Timestamp?)?.toDate();
          int availableRedemptions = data['available_redemptions'] ?? 0;
          List<dynamic> redeemedBy = data['redeemed_by'] ?? [];
          String? dealTier = data['deal_tier'] ?? '';

          return endDate != null &&
              endDate.isAfter(now) &&
              availableRedemptions > 0 &&
              !redeemedBy.contains(currentUserReference) &&
              dealTier == 'All';
        })
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    validDeals.sort((a, b) => (b['num_redemptions'] ?? 0)
        .compareTo(a['num_redemptions'] ?? 0)); // Sort by number of redemptions

    return validDeals.map((deal) => deal['id'] as String).toList();
  } catch (e) {
    print('Error filtering deals: $e');
    return [];
  }
}
