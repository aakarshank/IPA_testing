import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WhyBusinessesDeleteAccountRecord extends FirestoreRecord {
  WhyBusinessesDeleteAccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businessComment" field.
  String? _businessComment;
  String get businessComment => _businessComment ?? '';
  bool hasBusinessComment() => _businessComment != null;

  // "whenDeleted" field.
  DateTime? _whenDeleted;
  DateTime? get whenDeleted => _whenDeleted;
  bool hasWhenDeleted() => _whenDeleted != null;

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "businessEmail" field.
  String? _businessEmail;
  String get businessEmail => _businessEmail ?? '';
  bool hasBusinessEmail() => _businessEmail != null;

  void _initializeFields() {
    _businessComment = snapshotData['businessComment'] as String?;
    _whenDeleted = snapshotData['whenDeleted'] as DateTime?;
    _businessName = snapshotData['businessName'] as String?;
    _businessEmail = snapshotData['businessEmail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WhyBusinessesDeleteAccount');

  static Stream<WhyBusinessesDeleteAccountRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => WhyBusinessesDeleteAccountRecord.fromSnapshot(s));

  static Future<WhyBusinessesDeleteAccountRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WhyBusinessesDeleteAccountRecord.fromSnapshot(s));

  static WhyBusinessesDeleteAccountRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      WhyBusinessesDeleteAccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WhyBusinessesDeleteAccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WhyBusinessesDeleteAccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WhyBusinessesDeleteAccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WhyBusinessesDeleteAccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWhyBusinessesDeleteAccountRecordData({
  String? businessComment,
  DateTime? whenDeleted,
  String? businessName,
  String? businessEmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'businessComment': businessComment,
      'whenDeleted': whenDeleted,
      'businessName': businessName,
      'businessEmail': businessEmail,
    }.withoutNulls,
  );

  return firestoreData;
}

class WhyBusinessesDeleteAccountRecordDocumentEquality
    implements Equality<WhyBusinessesDeleteAccountRecord> {
  const WhyBusinessesDeleteAccountRecordDocumentEquality();

  @override
  bool equals(WhyBusinessesDeleteAccountRecord? e1,
      WhyBusinessesDeleteAccountRecord? e2) {
    return e1?.businessComment == e2?.businessComment &&
        e1?.whenDeleted == e2?.whenDeleted &&
        e1?.businessName == e2?.businessName &&
        e1?.businessEmail == e2?.businessEmail;
  }

  @override
  int hash(WhyBusinessesDeleteAccountRecord? e) => const ListEquality().hash(
      [e?.businessComment, e?.whenDeleted, e?.businessName, e?.businessEmail]);

  @override
  bool isValidKey(Object? o) => o is WhyBusinessesDeleteAccountRecord;
}
