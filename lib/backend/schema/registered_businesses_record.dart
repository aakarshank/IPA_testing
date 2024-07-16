import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegisteredBusinessesRecord extends FirestoreRecord {
  RegisteredBusinessesRecord._(
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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "hours" field.
  String? _hours;
  String get hours => _hours ?? '';
  bool hasHours() => _hours != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "all_addresses" field.
  List<String>? _allAddresses;
  List<String> get allAddresses => _allAddresses ?? const [];
  bool hasAllAddresses() => _allAddresses != null;

  // "all_locations" field.
  List<LatLng>? _allLocations;
  List<LatLng> get allLocations => _allLocations ?? const [];
  bool hasAllLocations() => _allLocations != null;

  // "moves_around" field.
  bool? _movesAround;
  bool get movesAround => _movesAround ?? false;
  bool hasMovesAround() => _movesAround != null;

  // "is_service" field.
  bool? _isService;
  bool get isService => _isService ?? false;
  bool hasIsService() => _isService != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _category = snapshotData['category'] as String?;
    _hours = snapshotData['hours'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _allAddresses = getDataList(snapshotData['all_addresses']);
    _allLocations = getDataList(snapshotData['all_locations']);
    _movesAround = snapshotData['moves_around'] as bool?;
    _isService = snapshotData['is_service'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RegisteredBusinesses');

  static Stream<RegisteredBusinessesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => RegisteredBusinessesRecord.fromSnapshot(s));

  static Future<RegisteredBusinessesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RegisteredBusinessesRecord.fromSnapshot(s));

  static RegisteredBusinessesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegisteredBusinessesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegisteredBusinessesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegisteredBusinessesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegisteredBusinessesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegisteredBusinessesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegisteredBusinessesRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? category,
  String? hours,
  String? city,
  String? state,
  bool? movesAround,
  bool? isService,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'category': category,
      'hours': hours,
      'city': city,
      'state': state,
      'moves_around': movesAround,
      'is_service': isService,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegisteredBusinessesRecordDocumentEquality
    implements Equality<RegisteredBusinessesRecord> {
  const RegisteredBusinessesRecordDocumentEquality();

  @override
  bool equals(RegisteredBusinessesRecord? e1, RegisteredBusinessesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.category == e2?.category &&
        e1?.hours == e2?.hours &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        listEquality.equals(e1?.allAddresses, e2?.allAddresses) &&
        listEquality.equals(e1?.allLocations, e2?.allLocations) &&
        e1?.movesAround == e2?.movesAround &&
        e1?.isService == e2?.isService;
  }

  @override
  int hash(RegisteredBusinessesRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.category,
        e?.hours,
        e?.city,
        e?.state,
        e?.allAddresses,
        e?.allLocations,
        e?.movesAround,
        e?.isService
      ]);

  @override
  bool isValidKey(Object? o) => o is RegisteredBusinessesRecord;
}
