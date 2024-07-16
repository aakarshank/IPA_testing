import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime hasDealExpired(DateTime dealEndDate) {
  DateTime currentTime = DateTime.now();

  if (dealEndDate.isBefore(currentTime)) {
    return currentTime;
  } else {
    return dealEndDate;
  }
}

int userTotalRedemptions(
  int diningCount,
  int apparelCount,
  int lifestyleCount,
  int electronicsCount,
  int fitnessCount,
  int petsCount,
  int homegardenCount,
  int automotiveCount,
  int dessertsCount,
  int entertainmentCount,
) {
  // gets sum of all arguments that are given to it
  return diningCount +
      apparelCount +
      lifestyleCount +
      electronicsCount +
      fitnessCount +
      petsCount +
      homegardenCount +
      automotiveCount +
      dessertsCount +
      entertainmentCount;
}

List<int> userPieChart(
  int dining,
  int apparel,
  int lifestyle,
  int electronics,
  int fitness,
  int pets,
  int homegarden,
  int automotive,
  int desserts,
  int entertainment,
) {
  // returns a list that consists of the arguments in order
  return [
    dining,
    apparel,
    lifestyle,
    electronics,
    fitness,
    pets,
    homegarden,
    automotive,
    desserts,
    entertainment,
  ];
}

Color hexToColor(String colorHex) {
  // gets hex code of color and returns it as Color date type
  return Color(int.parse(colorHex.substring(1, 7), radix: 16) + 0xFF000000);
}

bool isUserBday(String userBday) {
  // Check if the input string is valid (8 characters long)
  if (userBday.length != 8) {
    return false;
  }

  // Extract the month, day, and year from the input string
  int month = int.parse(userBday.substring(0, 2));
  int day = int.parse(userBday.substring(2, 4));
  int year = int.parse(userBday.substring(4, 8));

  // Create a DateTime object from the extracted values
  DateTime inputDate = DateTime(year, month, day);

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Check if the input date is the same as the current date
  return inputDate.month == currentDate.month &&
      inputDate.day == currentDate.day;
}

bool dealExpiredOnFounders(DateTime endMoment) {
  // Get the current time
  final currentTime = DateTime.now();

  // Check if the current time is before or equal to the endMoment
  if (currentTime.isBefore(endMoment) ||
      currentTime.isAtSameMomentAs(endMoment)) {
    return false;
  }

  return true;
}

DateTime stringToDateTime(String strArgument) {
  try {
    // Extract month, day, and year from the input string
    int month = int.parse(strArgument.substring(0, 2));
    int day = int.parse(strArgument.substring(2, 4));
    int year = int.parse(strArgument.substring(4, 8));

    // Create and return DateTime object
    return DateTime(year, month, day);
  } catch (e) {
    // If there's an error, throw an exception
    throw FormatException('Invalid date format: $strArgument');
  }
}

bool validBday(String userBday) {
  // Ensure the input string is exactly 8 characters long
  if (userBday.length != 8) {
    return false;
  }

  // Extract the month, day, and year parts from the string
  String monthStr = userBday.substring(0, 2);
  String dayStr = userBday.substring(2, 4);
  String yearStr = userBday.substring(4, 8);

  // Convert the parts to integers
  int? month = int.tryParse(monthStr);
  int? day = int.tryParse(dayStr);
  int? year = int.tryParse(yearStr);

  // Check if the parsing was successful
  if (month == null || day == null || year == null) {
    return false;
  }

  // Check if the month, day, and year are in valid ranges
  if (month < 1 ||
      month > 12 ||
      day < 1 ||
      day > 31 ||
      year < 1924 ||
      year > DateTime.now().year) {
    return false;
  }

  // Check if the day is valid for the month
  try {
    DateTime date = DateTime(year, month, day);
    // Check if the date is in the future
    if (date.isAfter(DateTime.now())) {
      // Ensure date is not in the future
      return false;
    }
    return true;
  } catch (e) {
    return false;
  }
}

bool validZipcode(String userZip) {
  // Ensure the input string is exactly 5 characters long
  if (userZip.length != 5) {
    return false;
  }

  // Check if all characters are digits
  if (!RegExp(r'^\d{5}$').hasMatch(userZip)) {
    return false;
  }

  // Extract the first two digits
  String firstTwoDigits = userZip.substring(0, 2);

  // Check if the first two digits are 75, 76, 77, 78, or 79
  List<String> validPrefixes = ['75', '76', '77', '78', '79'];
  if (validPrefixes.contains(firstTwoDigits)) {
    return true;
  }

  return false;
}

double getConversionRate(
  int clicks,
  int redemptions,
) {
  // returns argument 1/argument 2 to two decimal places
  double conversionRate = (redemptions / clicks) * 100;
  return double.parse(conversionRate.toStringAsFixed(2));
}

List<int> businessRedemByType(
  int percentageRedems,
  int cashRedems,
  int itemRedems,
  int otherRedems,
) {
  // returns arguments in list of same order as they're given
  return [percentageRedems, cashRedems, itemRedems, otherRedems];
}

int getUserAge(String dateString) {
  // Parse the input string to extract month, day, and year
  int month = int.parse(dateString.substring(0, 2));
  int day = int.parse(dateString.substring(2, 4));
  int year = int.parse(dateString.substring(4, 8));

  // Create a DateTime object from the extracted values
  DateTime inputDate = DateTime(year, month, day);

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the difference in years
  int yearsPassed = currentDate.year - inputDate.year;

  // Adjust the difference if the current date is before the input date in the current year
  if (currentDate.month < inputDate.month ||
      (currentDate.month == inputDate.month &&
          currentDate.day < inputDate.day)) {
    yearsPassed--;
  }

  return yearsPassed;
}

int getOnLoadDealsContainerHeight(int numofItems) {
  // returns argument multiplied by 220
  return numofItems * 220;
}

int getActiveDealsContainerWidthCopy(int numofItems) {
  // returns argument multiplied by 290
  return numofItems * 290;
}

int getActiveDealsContainerHeight(int numofItems) {
  // returns argument multiplied by 230
  return numofItems * 230;
}

List<int> businessRedemByAge(
  int ageOneCount,
  int ageTwoCount,
  int ageThreeCount,
  int ageFourCount,
  int ageFiveCount,
  int ageSixCount,
) {
  // returns arguments in same order in a list
  return [
    ageOneCount,
    ageTwoCount,
    ageThreeCount,
    ageFourCount,
    ageFiveCount,
    ageSixCount
  ];
}

List<String> getZipcodes(List<UsersRecord> userDocs) {
  // gets list of "Users" documents, adds all their "user_zipcode" fields to a list and returns it
  List<String> zipcodes = [];
  for (var user in userDocs) {
    zipcodes.add(user.userZipcode);
  }
  return zipcodes;
}

String getTopZipcode(List<String> zipCodesList) {
  // gets list of strings, returns string that repeats the most in argument
  Map<String, int> zipCodeCount = {};
  String? topZipCode;
  int maxCount = 0;

  for (String zipCode in zipCodesList) {
    if (zipCodeCount.containsKey(zipCode)) {
      zipCodeCount[zipCode] = zipCodeCount[zipCode]! + 1;
    } else {
      zipCodeCount[zipCode] = 1;
    }
    if (zipCodeCount[zipCode]! > maxCount) {
      maxCount = zipCodeCount[zipCode]!;
      topZipCode = zipCode;
    }
  }

  return topZipCode ?? '';
}

int getAvgAge(List<UsersRecord> userDocs) {
  int sum = 0;
  int count = 0; // Initialize count of valid userAge fields

  for (var user in userDocs) {
    if (user.userAge != null) {
      sum += user.userAge!;
      count++;
    }
  }

  // Calculate average age if there are valid userAge values
  return count == 0 ? 0 : (sum / count).round();
}

int getTierPercentile(
  int numTierUsers,
  int numAllUsers,
) {
  // return argument1/argument2 as a percentage
  return ((numTierUsers / numAllUsers) * 100).round();
}

int stringToInteger(String stringNum) {
  // gets string, converts to integer
  return int.parse(stringNum);
}

bool isValidNumber(String stringNum) {
  // gets string, returns true if it can be converted to integer, false if not
  try {
    int.parse(stringNum);
    return true;
  } catch (e) {
    return false;
  }
}

bool hasBeenMonth(DateTime lastEditTime) {
  final now = DateTime.now();

  // Calculate the date one month ago with edge case handling
  DateTime oneMonthAgo = DateTime(
    now.year,
    now.month - 1,
    now.day,
  );

  if (now.month == 1) {
    oneMonthAgo = DateTime(
      now.year - 1,
      12,
      now.day,
    );
  }

  return lastEditTime.isBefore(oneMonthAgo);
}

bool isUserAtBusiness(
  LatLng userLocation,
  List<LatLng> businessLocations,
) {
  const double earthRadius = 6371000; // Earth radius in meters

  double degToRad(double deg) {
    return deg * (math.pi / 180);
  }

  double haversineDistance(LatLng pos1, LatLng pos2) {
    final double lat1 = degToRad(pos1.latitude);
    final double lon1 = degToRad(pos1.longitude);
    final double lat2 = degToRad(pos2.latitude);
    final double lon2 = degToRad(pos2.longitude);

    final double dLat = lat2 - lat1;
    final double dLon = lon2 - lon1;

    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  for (LatLng businessLocation in businessLocations) {
    if (haversineDistance(userLocation, businessLocation) <= 50) {
      return true;
    }
  }

  return false;
}

int redemptionsNeeded(
  int threshold,
  int currentValue,
) {
  return math.max(0, threshold - currentValue);
}

bool redeemableTime(
  DateTime? startTime,
  DateTime? endTime,
) {
  // Check if both startTime and endTime are null
  if (startTime == null && endTime == null) {
    return true;
  }

  // If only one of them is null, return true (assumed behavior based on previous discussions)
  if (startTime == null || endTime == null) {
    return true;
  }

  // Get the current time
  final currentTime = DateTime.now();

  // Helper function to convert time to minutes since midnight
  int toMinutesSinceMidnight(DateTime time) => time.hour * 60 + time.minute;

  // Get minutes since midnight for current time, startTime, and endTime
  final currentTimeMinutes = toMinutesSinceMidnight(currentTime);
  final startMinutes = toMinutesSinceMidnight(startTime);
  final endMinutes = toMinutesSinceMidnight(endTime);

  // Check if time range does not overlap midnight
  if (startMinutes <= endMinutes) {
    // Normal time range check
    if (currentTimeMinutes >= startMinutes &&
        currentTimeMinutes <= endMinutes) {
      return true;
    }
  } else {
    // Time range overlaps midnight
    if (currentTimeMinutes >= startMinutes ||
        currentTimeMinutes <= endMinutes) {
      return true;
    }
  }

  return false;
}

bool dealExpiredCheck(DateTime endMoment) {
  // Get the current time
  final currentTime = DateTime.now();

  // Check if the current time is before or equal to the endMoment
  if (currentTime.isBefore(endMoment) ||
      currentTime.isAtSameMomentAs(endMoment)) {
    return true;
  }

  return false;
}

String writeRecurrence(
  List<String>? daysList,
  DateTime startMoment,
  DateTime endMoment,
) {
  if (daysList == null || daysList.isEmpty) {
    return '${DateFormat.Md().format(startMoment)} - ${DateFormat.Md().format(endMoment)}';
  }

  // Define all days of the week
  List<String> allDays = ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat'];

  // Sort daysList to ensure they are in order
  daysList.sort((a, b) => allDays.indexOf(a).compareTo(allDays.indexOf(b)));

  // Check if daysList exactly matches all weekdays
  Set<String> weekdaysSet = {'Mon', 'Tues', 'Wed', 'Thurs', 'Fri'};
  Set<String> daysSet = Set.from(daysList);
  if (daysSet.length == weekdaysSet.length &&
      daysSet.containsAll(weekdaysSet)) {
    return 'Every Weekday';
  }

  // Check if daysList exactly matches all days of the week
  if (daysSet.length == allDays.length &&
      daysSet.containsAll(allDays.toSet())) {
    return '${DateFormat.Md().format(startMoment)} - ${DateFormat.Md().format(endMoment)}';
  }

  // Join the sorted daysList into a single string separated by space
  return daysList.join(' ');
}

DateTime getMidnightTime() {
  return DateTime(1970, 1, 1, 0, 1);
}

bool canConvertStringToInt(String number) {
  try {
    // Attempt to convert the string to an integer
    int.parse(number);
    return true;
  } catch (e) {
    // Return false if conversion fails
    return false;
  }
}

List<String> splitString(String giantString) {
  // Remove all spaces from the upperCaseString
  String trimmedString = giantString.replaceAll(' ', '');

  // Split the trimmed string by commas to create a list of strings
  List<String> resultList = trimmedString.split(',');

  return resultList;
}

DateTime getBeforeMidnightTime() {
  return DateTime(1970, 1, 1, 23, 59);
}

String writeDealHours(
  DateTime startTime,
  DateTime endTime,
) {
  // Check if startTime is 12:01 AM and endTime is 11:59 PM
  DateFormat dateFormat = DateFormat.jm();
  String formattedStartTime = dateFormat.format(startTime);
  String formattedEndTime = dateFormat.format(endTime);

  if (formattedStartTime == '12:01 AM' && formattedEndTime == '11:59 PM') {
    return 'All business hours';
  } else {
    return '$formattedStartTime - $formattedEndTime';
  }
}

bool dealHasEverything(
  String? title,
  String? description,
  String? image,
  int? availableRedemptions,
  String? dealType,
  String? dealTier,
  String? category,
  String? recurrence,
  String? dealHours,
  DateTime? startTime,
  DateTime? endTime,
  DateTime? startMoment,
  DateTime? endMoment,
) {
  try {
    if (title == null ||
        title.isEmpty ||
        description == null ||
        description.isEmpty ||
        image == null ||
        image.isEmpty ||
        availableRedemptions == null ||
        dealType == null ||
        dealType.isEmpty ||
        dealTier == null ||
        dealTier.isEmpty ||
        category == null ||
        category.isEmpty ||
        recurrence == null ||
        recurrence.isEmpty ||
        dealHours == null ||
        dealHours.isEmpty ||
        startTime == null ||
        endTime == null ||
        startMoment == null ||
        endMoment == null) {
      return false;
    }
  } catch (e) {
    // If any error is thrown, return false
    return false;
  }
  return true;
}

bool doMomentsOverlap(
  DateTime startMoment,
  DateTime endMoment,
) {
  // returns true if startMoment is before endMoment, false otherwise
  return startMoment.isBefore(endMoment);
}

bool dealRedeemableToday(String recurrence) {
  // Get the current day of the week as an abbreviated string
  final currentDay = DateFormat('EEE').format(DateTime.now());

  // Handle special cases
  if (recurrence.contains("-")) {
    return true;
  }

  if (recurrence == "Every Weekday") {
    return currentDay != "Sat" && currentDay != "Sun";
  }

  // Split the recurrence string into a list of valid days
  final validDays = recurrence.split(' ');

  // Map valid days to their full form to ensure correct comparison
  final dayMap = {
    'Sun': 'Sun',
    'Mon': 'Mon',
    'Tues': 'Tue',
    'Wed': 'Wed',
    'Thurs': 'Thu',
    'Fri': 'Fri',
    'Sat': 'Sat',
  };

  // Check if the current day is in the list of valid days
  return validDays.contains(dayMap[currentDay]);
}

bool setUnlimitedRedemptions(int numRedemptions) {
  // returns true if argument < 100000, false otherwise
  return numRedemptions < 100000;
}

bool dealBegunCheck(DateTime startMoment) {
  // returns true if current time is after argument, false otherwise
  DateTime currentMoment = DateTime.now();
  return currentMoment.isAfter(startMoment);
}

List<DocumentReference> initializeRedeemedBy() {
  // returns empty list of argument data type
  return <DocumentReference>[];
}

List<String> initializeUniqueTo() {
  return <String>[];
}

bool simpleHasEverything(
  String title,
  String image,
  DateTime startMoment,
  DateTime endMoment,
  String titleColor,
  String recurrence,
  String dealHours,
  String dealType,
) {
  // returns true if all arguments are passed, false if not
  return title.isNotEmpty &&
      image.isNotEmpty &&
      startMoment != null &&
      endMoment != null &&
      titleColor.isNotEmpty &&
      recurrence.isNotEmpty &&
      dealHours.isNotEmpty &&
      dealType.isNotEmpty;
}

List<String> userTopCategories(
  int diningCount,
  int apparelCount,
  int lifestyleCount,
  int electronicsCount,
  int fitnessCount,
  int petsCount,
  int homegardenCount,
  int automotiveCount,
  int dessertsCount,
  int entertainmentCount,
) {
  // Define category associations
  Map<int, String> categoryMap = {
    diningCount: "Dining",
    apparelCount: "Apparel",
    lifestyleCount: "Lifestyle",
    electronicsCount: "Electronics",
    fitnessCount: "Fitness",
    petsCount: "Pets",
    homegardenCount: "Home & Garden",
    automotiveCount: "Automotive",
    dessertsCount: "Desserts",
    entertainmentCount: "Entertainment",
  };

  // Create a list of counts
  List<int> counts = [
    diningCount,
    apparelCount,
    lifestyleCount,
    electronicsCount,
    fitnessCount,
    petsCount,
    homegardenCount,
    automotiveCount,
    dessertsCount,
    entertainmentCount,
  ];

  // Sort counts in descending order
  counts.sort((a, b) => b.compareTo(a));

  // Retrieve the corresponding category names in the sorted order
  List<String> topCategories =
      counts.map((count) => categoryMap[count]).whereType<String>().toList();

  // Return the first five categories
  return topCategories.take(5).toList();
}

LatLng getClosestStore(
  List<LatLng> dealStores,
  LatLng userLocation,
) {
  // If the list has only one LatLng, return it
  if (dealStores.length == 1) {
    return dealStores[0];
  }

  // Function to calculate the distance between two LatLng points using the Haversine formula
  double calculateDistance(LatLng point1, LatLng point2) {
    const double R = 6371e3; // Earth radius in meters
    double lat1 = point1.latitude * (math.pi / 180);
    double lat2 = point2.latitude * (math.pi / 180);
    double deltaLat = (point2.latitude - point1.latitude) * (math.pi / 180);
    double deltaLng = (point2.longitude - point1.longitude) * (math.pi / 180);

    double a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(deltaLng / 2) *
            math.sin(deltaLng / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return R * c;
  }

  // Find the closest LatLng in the list
  LatLng closestStore = dealStores[0];
  double closestDistance = calculateDistance(closestStore, userLocation);

  for (LatLng store in dealStores) {
    double distance = calculateDistance(store, userLocation);
    if (distance < closestDistance) {
      closestStore = store;
      closestDistance = distance;
    }
  }

  return closestStore;
}

bool doesDealCheckLocation(
  bool movesAround,
  bool isService,
) {
  // if either argument is true return false, else return true
  if (movesAround || isService) {
    return false;
  } else {
    return true;
  }
}

bool enteredDealAddy(
  bool doesBizMove,
  String addyEntered,
) {
  if (!doesBizMove) {
    return true;
  } else if (doesBizMove && addyEntered != null && addyEntered.isNotEmpty) {
    return true;
  }
  return false;
}

bool isBusinessDealActive(
  DateTime dealEndMoment,
  int dealAvailableRedemptions,
) {
  final now = DateTime.now();
  return dealEndMoment.isAfter(now) && dealAvailableRedemptions > 0;
}

int getFavBizContainerHeight(int numofItems) {
  // returns argument multiplied by 130
  return numofItems * 130;
}

bool isValidCategoryDeal(
  DateTime dealEndMoment,
  int dealAvailableRedemptions,
  String dealTier,
  List<DocumentReference> dealRedeemedBy,
  DocumentReference userRef,
) {
  if (DateTime.now().isBefore(dealEndMoment) &&
      dealAvailableRedemptions > 0 &&
      dealTier == "All" &&
      !dealRedeemedBy.contains(userRef)) {
    return true;
  } else {
    return false;
  }
}

bool isDealRedeemable(
  DateTime dealEndMoment,
  int dealAvailableRedemptions,
  List<DocumentReference> dealRedeemedBy,
  DocumentReference userRef,
) {
  return DateTime.now().isBefore(dealEndMoment) &&
      dealAvailableRedemptions > 0 &&
      !dealRedeemedBy.contains(userRef);
}

bool isTierMember(
  int numRedemptions,
  int tierMin,
) {
  return numRedemptions >= tierMin;
}

bool isUsersExclusiveDeal(
  String dealTier,
  List<String>? bronzeBusinesses,
  List<String>? silverBusinesses,
  List<String>? goldBusinesses,
  String businessName,
) {
  return (dealTier == 'Bronze' &&
          bronzeBusinesses != null &&
          bronzeBusinesses.contains(businessName)) ||
      (dealTier == 'Silver' &&
          silverBusinesses != null &&
          silverBusinesses.contains(businessName)) ||
      (dealTier == 'Gold' &&
          goldBusinesses != null &&
          goldBusinesses.contains(businessName));
}

double getDistanceFromUser(
  List<LatLng> businessLocations,
  LatLng? userLocation,
) {
  double minDistance = double.infinity;
  if (userLocation == null) {
    return minDistance;
  }
  for (final location in businessLocations) {
    final distance = math.sqrt(
        math.pow(location.latitude - userLocation.latitude, 2) +
            math.pow(location.longitude - userLocation.longitude, 2));
    if (distance < minDistance) {
      minDistance = distance;
    }
  }
  return minDistance;
}

List<String> initializeEmptyStringList() {
  // returns empty list of strings
  return []; // returns an empty list of strings
}

String modifiesPhoneNumFormat(String phoneNumber) {
  // Remove spaces and dashes from the phone number
  String formattedNumber = phoneNumber.replaceAll(' ', '').replaceAll('-', '');

  return formattedNumber;
}

bool doesStringHavePlus(String phoneNum) {
  return phoneNum.contains('+');
}

bool ensureAllSignUpsFilled(
  String? userName,
  String? userPhone,
  String? userEmail,
) {
  // return true only if all arguments aren't null and aren't empty
  if (userName != null &&
      userName.isNotEmpty &&
      userPhone != null &&
      userPhone.isNotEmpty &&
      userEmail != null &&
      userEmail.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

bool? dealClickedOn(
  List<DocumentReference>? dealsList,
  DocumentReference? deal,
) {
  // return true or false whether or not the deal ref is in the list of dealrefs
  return dealsList?.contains(deal) ?? false;
}
