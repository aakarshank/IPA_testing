import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZipcodesRecord extends FirestoreRecord {
  ZipcodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businessRef" field.
  DocumentReference? _businessRef;
  DocumentReference? get businessRef => _businessRef;
  bool hasBusinessRef() => _businessRef != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  bool hasZipcode() => _zipcode != null;

  // "redemptionsThere" field.
  int? _redemptionsThere;
  int get redemptionsThere => _redemptionsThere ?? 0;
  bool hasRedemptionsThere() => _redemptionsThere != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _businessRef = snapshotData['businessRef'] as DocumentReference?;
    _zipcode = snapshotData['zipcode'] as String?;
    _redemptionsThere = castToType<int>(snapshotData['redemptionsThere']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Zipcodes')
          : FirebaseFirestore.instance.collectionGroup('Zipcodes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Zipcodes').doc(id);

  static Stream<ZipcodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZipcodesRecord.fromSnapshot(s));

  static Future<ZipcodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZipcodesRecord.fromSnapshot(s));

  static ZipcodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ZipcodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZipcodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZipcodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZipcodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZipcodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZipcodesRecordData({
  DocumentReference? businessRef,
  String? zipcode,
  int? redemptionsThere,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'businessRef': businessRef,
      'zipcode': zipcode,
      'redemptionsThere': redemptionsThere,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZipcodesRecordDocumentEquality implements Equality<ZipcodesRecord> {
  const ZipcodesRecordDocumentEquality();

  @override
  bool equals(ZipcodesRecord? e1, ZipcodesRecord? e2) {
    return e1?.businessRef == e2?.businessRef &&
        e1?.zipcode == e2?.zipcode &&
        e1?.redemptionsThere == e2?.redemptionsThere;
  }

  @override
  int hash(ZipcodesRecord? e) => const ListEquality()
      .hash([e?.businessRef, e?.zipcode, e?.redemptionsThere]);

  @override
  bool isValidKey(Object? o) => o is ZipcodesRecord;
}
