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

Future<List<String>> filterValidExclusiveDeals() async {
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

    // Get the current user's document to access user_bronze_businesses, user_silver_businesses, and user_gold_businesses
    DocumentSnapshot userDoc = await currentUserReference.get();
    List<String> userBronzeBusinesses =
        List<String>.from(userDoc['user_bronze_businesses'] ?? []);
    List<String> userSilverBusinesses =
        List<String>.from(userDoc['user_silver_businesses'] ?? []);
    List<String> userGoldBusinesses =
        List<String>.from(userDoc['user_gold_businesses'] ?? []);

    // Query the deals collection
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('deals').get();

    // Filter the deals based on the conditions
    List<String> validDealIds = querySnapshot.docs
        .where((doc) {
          final data = doc.data() as Map<String, dynamic>? ?? {};
          DateTime? endDate = (data['end_moment'] as Timestamp?)?.toDate();
          int availableRedemptions = data['available_redemptions'] ?? 0;
          List<dynamic> redeemedBy = data['redeemed_by'] ?? [];
          String dealTier = data['deal_tier'] ?? '';
          String businessName = data['business_name'] ?? '';

          return endDate != null &&
              endDate.isAfter(now) &&
              availableRedemptions > 0 &&
              !redeemedBy.contains(currentUserReference) &&
              ((dealTier == 'Bronze' &&
                      userBronzeBusinesses.contains(businessName)) ||
                  (dealTier == 'Silver' &&
                      userSilverBusinesses.contains(businessName)) ||
                  (dealTier == 'Gold' &&
                      userGoldBusinesses.contains(businessName)));
        })
        .map((doc) => doc.id)
        .toList();

    return validDealIds;
  } catch (e) {
    print('Error filtering deals: $e');
    return [];
  }
}
