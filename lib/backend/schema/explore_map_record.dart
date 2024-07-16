import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExploreMapRecord extends FirestoreRecord {
  ExploreMapRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "business_city" field.
  String? _businessCity;
  String get businessCity => _businessCity ?? '';
  bool hasBusinessCity() => _businessCity != null;

  // "business_state" field.
  String? _businessState;
  String get businessState => _businessState ?? '';
  bool hasBusinessState() => _businessState != null;

  // "business_location" field.
  LatLng? _businessLocation;
  LatLng? get businessLocation => _businessLocation;
  bool hasBusinessLocation() => _businessLocation != null;

  // "business_photo" field.
  String? _businessPhoto;
  String get businessPhoto => _businessPhoto ?? '';
  bool hasBusinessPhoto() => _businessPhoto != null;

  void _initializeFields() {
    _businessName = snapshotData['business_name'] as String?;
    _businessCity = snapshotData['business_city'] as String?;
    _businessState = snapshotData['business_state'] as String?;
    _businessLocation = snapshotData['business_location'] as LatLng?;
    _businessPhoto = snapshotData['business_photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ExploreMap');

  static Stream<ExploreMapRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExploreMapRecord.fromSnapshot(s));

  static Future<ExploreMapRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExploreMapRecord.fromSnapshot(s));

  static ExploreMapRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExploreMapRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExploreMapRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExploreMapRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExploreMapRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExploreMapRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExploreMapRecordData({
  String? businessName,
  String? businessCity,
  String? businessState,
  LatLng? businessLocation,
  String? businessPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business_name': businessName,
      'business_city': businessCity,
      'business_state': businessState,
      'business_location': businessLocation,
      'business_photo': businessPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExploreMapRecordDocumentEquality implements Equality<ExploreMapRecord> {
  const ExploreMapRecordDocumentEquality();

  @override
  bool equals(ExploreMapRecord? e1, ExploreMapRecord? e2) {
    return e1?.businessName == e2?.businessName &&
        e1?.businessCity == e2?.businessCity &&
        e1?.businessState == e2?.businessState &&
        e1?.businessLocation == e2?.businessLocation &&
        e1?.businessPhoto == e2?.businessPhoto;
  }

  @override
  int hash(ExploreMapRecord? e) => const ListEquality().hash([
        e?.businessName,
        e?.businessCity,
        e?.businessState,
        e?.businessLocation,
        e?.businessPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is ExploreMapRecord;
}
