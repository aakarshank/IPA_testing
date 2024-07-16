// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Define your custom function to update the "end_moment" field
Future<void> scheduleDealDeletion(DealsRecord deal) async {
  // Get the current time
  final DateTime currentTime = DateTime.now();
  // Add 15 minutes to the current time
  final DateTime updatedEndMoment = currentTime.add(Duration(minutes: 15));
  // Update the "end_moment" field of the provided deal document
  await deal.reference.update({'end_moment': updatedEndMoment});
}
