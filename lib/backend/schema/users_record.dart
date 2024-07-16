import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_num_redemptions" field.
  int? _userNumRedemptions;
  int get userNumRedemptions => _userNumRedemptions ?? 0;
  bool hasUserNumRedemptions() => _userNumRedemptions != null;

  // "user_birthday" field.
  String? _userBirthday;
  String get userBirthday => _userBirthday ?? '';
  bool hasUserBirthday() => _userBirthday != null;

  // "user_age" field.
  int? _userAge;
  int get userAge => _userAge ?? 0;
  bool hasUserAge() => _userAge != null;

  // "user_zipcode" field.
  String? _userZipcode;
  String get userZipcode => _userZipcode ?? '';
  bool hasUserZipcode() => _userZipcode != null;

  // "business_category" field.
  String? _businessCategory;
  String get businessCategory => _businessCategory ?? '';
  bool hasBusinessCategory() => _businessCategory != null;

  // "business_hours" field.
  String? _businessHours;
  String get businessHours => _businessHours ?? '';
  bool hasBusinessHours() => _businessHours != null;

  // "business_city" field.
  String? _businessCity;
  String get businessCity => _businessCity ?? '';
  bool hasBusinessCity() => _businessCity != null;

  // "business_state" field.
  String? _businessState;
  String get businessState => _businessState ?? '';
  bool hasBusinessState() => _businessState != null;

  // "business_num_clicks" field.
  int? _businessNumClicks;
  int get businessNumClicks => _businessNumClicks ?? 0;
  bool hasBusinessNumClicks() => _businessNumClicks != null;

  // "business_num_redemptions" field.
  int? _businessNumRedemptions;
  int get businessNumRedemptions => _businessNumRedemptions ?? 0;
  bool hasBusinessNumRedemptions() => _businessNumRedemptions != null;

  // "user_dining_count" field.
  int? _userDiningCount;
  int get userDiningCount => _userDiningCount ?? 0;
  bool hasUserDiningCount() => _userDiningCount != null;

  // "user_apparel_count" field.
  int? _userApparelCount;
  int get userApparelCount => _userApparelCount ?? 0;
  bool hasUserApparelCount() => _userApparelCount != null;

  // "user_lifestyle_count" field.
  int? _userLifestyleCount;
  int get userLifestyleCount => _userLifestyleCount ?? 0;
  bool hasUserLifestyleCount() => _userLifestyleCount != null;

  // "user_electronics_count" field.
  int? _userElectronicsCount;
  int get userElectronicsCount => _userElectronicsCount ?? 0;
  bool hasUserElectronicsCount() => _userElectronicsCount != null;

  // "user_fitness_count" field.
  int? _userFitnessCount;
  int get userFitnessCount => _userFitnessCount ?? 0;
  bool hasUserFitnessCount() => _userFitnessCount != null;

  // "user_pets_count" field.
  int? _userPetsCount;
  int get userPetsCount => _userPetsCount ?? 0;
  bool hasUserPetsCount() => _userPetsCount != null;

  // "user_homegarden_count" field.
  int? _userHomegardenCount;
  int get userHomegardenCount => _userHomegardenCount ?? 0;
  bool hasUserHomegardenCount() => _userHomegardenCount != null;

  // "user_automotive_count" field.
  int? _userAutomotiveCount;
  int get userAutomotiveCount => _userAutomotiveCount ?? 0;
  bool hasUserAutomotiveCount() => _userAutomotiveCount != null;

  // "user_desserts_count" field.
  int? _userDessertsCount;
  int get userDessertsCount => _userDessertsCount ?? 0;
  bool hasUserDessertsCount() => _userDessertsCount != null;

  // "user_entertainment_count" field.
  int? _userEntertainmentCount;
  int get userEntertainmentCount => _userEntertainmentCount ?? 0;
  bool hasUserEntertainmentCount() => _userEntertainmentCount != null;

  // "user_businesses_visited" field.
  List<String>? _userBusinessesVisited;
  List<String> get userBusinessesVisited => _userBusinessesVisited ?? const [];
  bool hasUserBusinessesVisited() => _userBusinessesVisited != null;

  // "user_bronze_businesses" field.
  List<String>? _userBronzeBusinesses;
  List<String> get userBronzeBusinesses => _userBronzeBusinesses ?? const [];
  bool hasUserBronzeBusinesses() => _userBronzeBusinesses != null;

  // "user_silver_businesses" field.
  List<String>? _userSilverBusinesses;
  List<String> get userSilverBusinesses => _userSilverBusinesses ?? const [];
  bool hasUserSilverBusinesses() => _userSilverBusinesses != null;

  // "user_gold_businesses" field.
  List<String>? _userGoldBusinesses;
  List<String> get userGoldBusinesses => _userGoldBusinesses ?? const [];
  bool hasUserGoldBusinesses() => _userGoldBusinesses != null;

  // "business_percentage_redemptions" field.
  int? _businessPercentageRedemptions;
  int get businessPercentageRedemptions => _businessPercentageRedemptions ?? 0;
  bool hasBusinessPercentageRedemptions() =>
      _businessPercentageRedemptions != null;

  // "business_cash_redemptions" field.
  int? _businessCashRedemptions;
  int get businessCashRedemptions => _businessCashRedemptions ?? 0;
  bool hasBusinessCashRedemptions() => _businessCashRedemptions != null;

  // "business_item_redemptions" field.
  int? _businessItemRedemptions;
  int get businessItemRedemptions => _businessItemRedemptions ?? 0;
  bool hasBusinessItemRedemptions() => _businessItemRedemptions != null;

  // "business_other_redemptions" field.
  int? _businessOtherRedemptions;
  int get businessOtherRedemptions => _businessOtherRedemptions ?? 0;
  bool hasBusinessOtherRedemptions() => _businessOtherRedemptions != null;

  // "business_ageone_redemptions" field.
  int? _businessAgeoneRedemptions;
  int get businessAgeoneRedemptions => _businessAgeoneRedemptions ?? 0;
  bool hasBusinessAgeoneRedemptions() => _businessAgeoneRedemptions != null;

  // "business_agetwo_redemptions" field.
  int? _businessAgetwoRedemptions;
  int get businessAgetwoRedemptions => _businessAgetwoRedemptions ?? 0;
  bool hasBusinessAgetwoRedemptions() => _businessAgetwoRedemptions != null;

  // "business_agethree_redemptions" field.
  int? _businessAgethreeRedemptions;
  int get businessAgethreeRedemptions => _businessAgethreeRedemptions ?? 0;
  bool hasBusinessAgethreeRedemptions() => _businessAgethreeRedemptions != null;

  // "business_agefour_redemptions" field.
  int? _businessAgefourRedemptions;
  int get businessAgefourRedemptions => _businessAgefourRedemptions ?? 0;
  bool hasBusinessAgefourRedemptions() => _businessAgefourRedemptions != null;

  // "business_agefive_redemptions" field.
  int? _businessAgefiveRedemptions;
  int get businessAgefiveRedemptions => _businessAgefiveRedemptions ?? 0;
  bool hasBusinessAgefiveRedemptions() => _businessAgefiveRedemptions != null;

  // "business_agesix_redemptions" field.
  int? _businessAgesixRedemptions;
  int get businessAgesixRedemptions => _businessAgesixRedemptions ?? 0;
  bool hasBusinessAgesixRedemptions() => _businessAgesixRedemptions != null;

  // "business_all_addresses" field.
  List<String>? _businessAllAddresses;
  List<String> get businessAllAddresses => _businessAllAddresses ?? const [];
  bool hasBusinessAllAddresses() => _businessAllAddresses != null;

  // "business_all_locations" field.
  List<LatLng>? _businessAllLocations;
  List<LatLng> get businessAllLocations => _businessAllLocations ?? const [];
  bool hasBusinessAllLocations() => _businessAllLocations != null;

  // "business_moves_around" field.
  bool? _businessMovesAround;
  bool get businessMovesAround => _businessMovesAround ?? false;
  bool hasBusinessMovesAround() => _businessMovesAround != null;

  // "business_is_service" field.
  bool? _businessIsService;
  bool get businessIsService => _businessIsService ?? false;
  bool hasBusinessIsService() => _businessIsService != null;

  // "founderRef" field.
  DocumentReference? _founderRef;
  DocumentReference? get founderRef => _founderRef;
  bool hasFounderRef() => _founderRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userNumRedemptions = castToType<int>(snapshotData['user_num_redemptions']);
    _userBirthday = snapshotData['user_birthday'] as String?;
    _userAge = castToType<int>(snapshotData['user_age']);
    _userZipcode = snapshotData['user_zipcode'] as String?;
    _businessCategory = snapshotData['business_category'] as String?;
    _businessHours = snapshotData['business_hours'] as String?;
    _businessCity = snapshotData['business_city'] as String?;
    _businessState = snapshotData['business_state'] as String?;
    _businessNumClicks = castToType<int>(snapshotData['business_num_clicks']);
    _businessNumRedemptions =
        castToType<int>(snapshotData['business_num_redemptions']);
    _userDiningCount = castToType<int>(snapshotData['user_dining_count']);
    _userApparelCount = castToType<int>(snapshotData['user_apparel_count']);
    _userLifestyleCount = castToType<int>(snapshotData['user_lifestyle_count']);
    _userElectronicsCount =
        castToType<int>(snapshotData['user_electronics_count']);
    _userFitnessCount = castToType<int>(snapshotData['user_fitness_count']);
    _userPetsCount = castToType<int>(snapshotData['user_pets_count']);
    _userHomegardenCount =
        castToType<int>(snapshotData['user_homegarden_count']);
    _userAutomotiveCount =
        castToType<int>(snapshotData['user_automotive_count']);
    _userDessertsCount = castToType<int>(snapshotData['user_desserts_count']);
    _userEntertainmentCount =
        castToType<int>(snapshotData['user_entertainment_count']);
    _userBusinessesVisited =
        getDataList(snapshotData['user_businesses_visited']);
    _userBronzeBusinesses = getDataList(snapshotData['user_bronze_businesses']);
    _userSilverBusinesses = getDataList(snapshotData['user_silver_businesses']);
    _userGoldBusinesses = getDataList(snapshotData['user_gold_businesses']);
    _businessPercentageRedemptions =
        castToType<int>(snapshotData['business_percentage_redemptions']);
    _businessCashRedemptions =
        castToType<int>(snapshotData['business_cash_redemptions']);
    _businessItemRedemptions =
        castToType<int>(snapshotData['business_item_redemptions']);
    _businessOtherRedemptions =
        castToType<int>(snapshotData['business_other_redemptions']);
    _businessAgeoneRedemptions =
        castToType<int>(snapshotData['business_ageone_redemptions']);
    _businessAgetwoRedemptions =
        castToType<int>(snapshotData['business_agetwo_redemptions']);
    _businessAgethreeRedemptions =
        castToType<int>(snapshotData['business_agethree_redemptions']);
    _businessAgefourRedemptions =
        castToType<int>(snapshotData['business_agefour_redemptions']);
    _businessAgefiveRedemptions =
        castToType<int>(snapshotData['business_agefive_redemptions']);
    _businessAgesixRedemptions =
        castToType<int>(snapshotData['business_agesix_redemptions']);
    _businessAllAddresses = getDataList(snapshotData['business_all_addresses']);
    _businessAllLocations = getDataList(snapshotData['business_all_locations']);
    _businessMovesAround = snapshotData['business_moves_around'] as bool?;
    _businessIsService = snapshotData['business_is_service'] as bool?;
    _founderRef = snapshotData['founderRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? userNumRedemptions,
  String? userBirthday,
  int? userAge,
  String? userZipcode,
  String? businessCategory,
  String? businessHours,
  String? businessCity,
  String? businessState,
  int? businessNumClicks,
  int? businessNumRedemptions,
  int? userDiningCount,
  int? userApparelCount,
  int? userLifestyleCount,
  int? userElectronicsCount,
  int? userFitnessCount,
  int? userPetsCount,
  int? userHomegardenCount,
  int? userAutomotiveCount,
  int? userDessertsCount,
  int? userEntertainmentCount,
  int? businessPercentageRedemptions,
  int? businessCashRedemptions,
  int? businessItemRedemptions,
  int? businessOtherRedemptions,
  int? businessAgeoneRedemptions,
  int? businessAgetwoRedemptions,
  int? businessAgethreeRedemptions,
  int? businessAgefourRedemptions,
  int? businessAgefiveRedemptions,
  int? businessAgesixRedemptions,
  bool? businessMovesAround,
  bool? businessIsService,
  DocumentReference? founderRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_num_redemptions': userNumRedemptions,
      'user_birthday': userBirthday,
      'user_age': userAge,
      'user_zipcode': userZipcode,
      'business_category': businessCategory,
      'business_hours': businessHours,
      'business_city': businessCity,
      'business_state': businessState,
      'business_num_clicks': businessNumClicks,
      'business_num_redemptions': businessNumRedemptions,
      'user_dining_count': userDiningCount,
      'user_apparel_count': userApparelCount,
      'user_lifestyle_count': userLifestyleCount,
      'user_electronics_count': userElectronicsCount,
      'user_fitness_count': userFitnessCount,
      'user_pets_count': userPetsCount,
      'user_homegarden_count': userHomegardenCount,
      'user_automotive_count': userAutomotiveCount,
      'user_desserts_count': userDessertsCount,
      'user_entertainment_count': userEntertainmentCount,
      'business_percentage_redemptions': businessPercentageRedemptions,
      'business_cash_redemptions': businessCashRedemptions,
      'business_item_redemptions': businessItemRedemptions,
      'business_other_redemptions': businessOtherRedemptions,
      'business_ageone_redemptions': businessAgeoneRedemptions,
      'business_agetwo_redemptions': businessAgetwoRedemptions,
      'business_agethree_redemptions': businessAgethreeRedemptions,
      'business_agefour_redemptions': businessAgefourRedemptions,
      'business_agefive_redemptions': businessAgefiveRedemptions,
      'business_agesix_redemptions': businessAgesixRedemptions,
      'business_moves_around': businessMovesAround,
      'business_is_service': businessIsService,
      'founderRef': founderRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userNumRedemptions == e2?.userNumRedemptions &&
        e1?.userBirthday == e2?.userBirthday &&
        e1?.userAge == e2?.userAge &&
        e1?.userZipcode == e2?.userZipcode &&
        e1?.businessCategory == e2?.businessCategory &&
        e1?.businessHours == e2?.businessHours &&
        e1?.businessCity == e2?.businessCity &&
        e1?.businessState == e2?.businessState &&
        e1?.businessNumClicks == e2?.businessNumClicks &&
        e1?.businessNumRedemptions == e2?.businessNumRedemptions &&
        e1?.userDiningCount == e2?.userDiningCount &&
        e1?.userApparelCount == e2?.userApparelCount &&
        e1?.userLifestyleCount == e2?.userLifestyleCount &&
        e1?.userElectronicsCount == e2?.userElectronicsCount &&
        e1?.userFitnessCount == e2?.userFitnessCount &&
        e1?.userPetsCount == e2?.userPetsCount &&
        e1?.userHomegardenCount == e2?.userHomegardenCount &&
        e1?.userAutomotiveCount == e2?.userAutomotiveCount &&
        e1?.userDessertsCount == e2?.userDessertsCount &&
        e1?.userEntertainmentCount == e2?.userEntertainmentCount &&
        listEquality.equals(
            e1?.userBusinessesVisited, e2?.userBusinessesVisited) &&
        listEquality.equals(
            e1?.userBronzeBusinesses, e2?.userBronzeBusinesses) &&
        listEquality.equals(
            e1?.userSilverBusinesses, e2?.userSilverBusinesses) &&
        listEquality.equals(e1?.userGoldBusinesses, e2?.userGoldBusinesses) &&
        e1?.businessPercentageRedemptions ==
            e2?.businessPercentageRedemptions &&
        e1?.businessCashRedemptions == e2?.businessCashRedemptions &&
        e1?.businessItemRedemptions == e2?.businessItemRedemptions &&
        e1?.businessOtherRedemptions == e2?.businessOtherRedemptions &&
        e1?.businessAgeoneRedemptions == e2?.businessAgeoneRedemptions &&
        e1?.businessAgetwoRedemptions == e2?.businessAgetwoRedemptions &&
        e1?.businessAgethreeRedemptions == e2?.businessAgethreeRedemptions &&
        e1?.businessAgefourRedemptions == e2?.businessAgefourRedemptions &&
        e1?.businessAgefiveRedemptions == e2?.businessAgefiveRedemptions &&
        e1?.businessAgesixRedemptions == e2?.businessAgesixRedemptions &&
        listEquality.equals(
            e1?.businessAllAddresses, e2?.businessAllAddresses) &&
        listEquality.equals(
            e1?.businessAllLocations, e2?.businessAllLocations) &&
        e1?.businessMovesAround == e2?.businessMovesAround &&
        e1?.businessIsService == e2?.businessIsService &&
        e1?.founderRef == e2?.founderRef;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userNumRedemptions,
        e?.userBirthday,
        e?.userAge,
        e?.userZipcode,
        e?.businessCategory,
        e?.businessHours,
        e?.businessCity,
        e?.businessState,
        e?.businessNumClicks,
        e?.businessNumRedemptions,
        e?.userDiningCount,
        e?.userApparelCount,
        e?.userLifestyleCount,
        e?.userElectronicsCount,
        e?.userFitnessCount,
        e?.userPetsCount,
        e?.userHomegardenCount,
        e?.userAutomotiveCount,
        e?.userDessertsCount,
        e?.userEntertainmentCount,
        e?.userBusinessesVisited,
        e?.userBronzeBusinesses,
        e?.userSilverBusinesses,
        e?.userGoldBusinesses,
        e?.businessPercentageRedemptions,
        e?.businessCashRedemptions,
        e?.businessItemRedemptions,
        e?.businessOtherRedemptions,
        e?.businessAgeoneRedemptions,
        e?.businessAgetwoRedemptions,
        e?.businessAgethreeRedemptions,
        e?.businessAgefourRedemptions,
        e?.businessAgefiveRedemptions,
        e?.businessAgesixRedemptions,
        e?.businessAllAddresses,
        e?.businessAllLocations,
        e?.businessMovesAround,
        e?.businessIsService,
        e?.founderRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
