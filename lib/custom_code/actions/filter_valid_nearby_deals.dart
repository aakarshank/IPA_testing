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
import 'package:geolocator/geolocator.dart';

Future<List<String>> filterValidNearbyDeals() async {
  try {
    DateTime now = DateTime.now();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }

    LatLng userLocation = await getCurrentDeviceLocation();
    if (userLocation == null) {
      print('Failed to fetch user location');
      return [];
    }

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('deals').get();
    List<Map<String, dynamic>> validDeals = [];

    await Future.forEach(querySnapshot.docs, (DocumentSnapshot doc) async {
      final data = doc.data() as Map<String, dynamic>? ?? {};
      DateTime? endDate = (data['end_moment'] as Timestamp?)?.toDate();
      int availableRedemptions = data['available_redemptions'] ?? 0;
      List<dynamic> redeemedBy = data['redeemed_by'] ?? [];
      List<LatLng> businessLocations =
          (data['business_locations'] as List<dynamic>?)?.map((location) {
                final latLng = location as Map<String, dynamic>;
                return LatLng(latLng['latitude'] as double,
                    latLng['longitude'] as double);
              }).toList() ??
              [];

      if (endDate != null &&
          endDate.isAfter(now) &&
          availableRedemptions > 0 &&
          !redeemedBy.contains(currentUser.uid) &&
          businessLocations.isNotEmpty) {
        double closestDistance =
            await getClosestDistance(businessLocations, userLocation);
        if (closestDistance != double.infinity) {
          data['distance_from_user'] = closestDistance;
          validDeals.add(data);
        }
      }
    });

    validDeals.sort((a, b) => (a['distance_from_user'] as double)
        .compareTo(b['distance_from_user'] as double));

    return validDeals.map((deal) => deal['id'] as String).toList();
  } catch (e) {
    print('Error filtering deals: $e');
    return [];
  }
}

Future<double> calculateDistance(LatLng start, LatLng end) async {
  return Geolocator.distanceBetween(
          start.latitude, start.longitude, end.latitude, end.longitude) /
      1609.34; // Convert to miles
}

Future<LatLng> getCurrentDeviceLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, don't continue
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, don't continue
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, don't continue
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can continue
  Position position = await Geolocator.getCurrentPosition();
  return LatLng(position.latitude, position.longitude);
}

Future<double> getClosestDistance(
    List<LatLng> locations, LatLng userLocation) async {
  double closestDistance = double.infinity;
  for (var location in locations) {
    double distance = await calculateDistance(userLocation, location);
    if (distance < closestDistance) {
      closestDistance = distance;
    }
  }
  return closestDistance;
}
