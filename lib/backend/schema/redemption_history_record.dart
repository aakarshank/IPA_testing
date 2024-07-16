import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedemptionHistoryRecord extends FirestoreRecord {
  RedemptionHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "whenRedeemed" field.
  DateTime? _whenRedeemed;
  DateTime? get whenRedeemed => _whenRedeemed;
  bool hasWhenRedeemed() => _whenRedeemed != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "dealTitle" field.
  String? _dealTitle;
  String get dealTitle => _dealTitle ?? '';
  bool hasDealTitle() => _dealTitle != null;

  // "dealImage" field.
  String? _dealImage;
  String get dealImage => _dealImage ?? '';
  bool hasDealImage() => _dealImage != null;

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _whenRedeemed = snapshotData['whenRedeemed'] as DateTime?;
    _userName = snapshotData['userName'] as String?;
    _userID = snapshotData['userID'] as String?;
    _dealTitle = snapshotData['dealTitle'] as String?;
    _dealImage = snapshotData['dealImage'] as String?;
    _businessName = snapshotData['businessName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('RedemptionHistory')
          : FirebaseFirestore.instance.collectionGroup('RedemptionHistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('RedemptionHistory').doc(id);

  static Stream<RedemptionHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RedemptionHistoryRecord.fromSnapshot(s));

  static Future<RedemptionHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RedemptionHistoryRecord.fromSnapshot(s));

  static RedemptionHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RedemptionHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RedemptionHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RedemptionHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RedemptionHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RedemptionHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRedemptionHistoryRecordData({
  DocumentReference? userRef,
  DateTime? whenRedeemed,
  String? userName,
  String? userID,
  String? dealTitle,
  String? dealImage,
  String? businessName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'whenRedeemed': whenRedeemed,
      'userName': userName,
      'userID': userID,
      'dealTitle': dealTitle,
      'dealImage': dealImage,
      'businessName': businessName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RedemptionHistoryRecordDocumentEquality
    implements Equality<RedemptionHistoryRecord> {
  const RedemptionHistoryRecordDocumentEquality();

  @override
  bool equals(RedemptionHistoryRecord? e1, RedemptionHistoryRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.whenRedeemed == e2?.whenRedeemed &&
        e1?.userName == e2?.userName &&
        e1?.userID == e2?.userID &&
        e1?.dealTitle == e2?.dealTitle &&
        e1?.dealImage == e2?.dealImage &&
        e1?.businessName == e2?.businessName;
  }

  @override
  int hash(RedemptionHistoryRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.whenRedeemed,
        e?.userName,
        e?.userID,
        e?.dealTitle,
        e?.dealImage,
        e?.businessName
      ]);

  @override
  bool isValidKey(Object? o) => o is RedemptionHistoryRecord;
}
