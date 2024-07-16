import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WhyUsersDeleteAccountRecord extends FirestoreRecord {
  WhyUsersDeleteAccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userComment" field.
  String? _userComment;
  String get userComment => _userComment ?? '';
  bool hasUserComment() => _userComment != null;

  // "whenDeleted" field.
  DateTime? _whenDeleted;
  DateTime? get whenDeleted => _whenDeleted;
  bool hasWhenDeleted() => _whenDeleted != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userPhone" field.
  String? _userPhone;
  String get userPhone => _userPhone ?? '';
  bool hasUserPhone() => _userPhone != null;

  // "founderRef" field.
  DocumentReference? _founderRef;
  DocumentReference? get founderRef => _founderRef;
  bool hasFounderRef() => _founderRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _userComment = snapshotData['userComment'] as String?;
    _whenDeleted = snapshotData['whenDeleted'] as DateTime?;
    _userName = snapshotData['userName'] as String?;
    _userPhone = snapshotData['userPhone'] as String?;
    _founderRef = snapshotData['founderRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WhyUsersDeleteAccount');

  static Stream<WhyUsersDeleteAccountRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WhyUsersDeleteAccountRecord.fromSnapshot(s));

  static Future<WhyUsersDeleteAccountRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WhyUsersDeleteAccountRecord.fromSnapshot(s));

  static WhyUsersDeleteAccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WhyUsersDeleteAccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WhyUsersDeleteAccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WhyUsersDeleteAccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WhyUsersDeleteAccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WhyUsersDeleteAccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWhyUsersDeleteAccountRecordData({
  String? userComment,
  DateTime? whenDeleted,
  String? userName,
  String? userPhone,
  DocumentReference? founderRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userComment': userComment,
      'whenDeleted': whenDeleted,
      'userName': userName,
      'userPhone': userPhone,
      'founderRef': founderRef,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class WhyUsersDeleteAccountRecordDocumentEquality
    implements Equality<WhyUsersDeleteAccountRecord> {
  const WhyUsersDeleteAccountRecordDocumentEquality();

  @override
  bool equals(
      WhyUsersDeleteAccountRecord? e1, WhyUsersDeleteAccountRecord? e2) {
    return e1?.userComment == e2?.userComment &&
        e1?.whenDeleted == e2?.whenDeleted &&
        e1?.userName == e2?.userName &&
        e1?.userPhone == e2?.userPhone &&
        e1?.founderRef == e2?.founderRef &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(WhyUsersDeleteAccountRecord? e) => const ListEquality().hash([
        e?.userComment,
        e?.whenDeleted,
        e?.userName,
        e?.userPhone,
        e?.founderRef,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is WhyUsersDeleteAccountRecord;
}
