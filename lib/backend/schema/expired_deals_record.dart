import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpiredDealsRecord extends FirestoreRecord {
  ExpiredDealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "num_clicks" field.
  int? _numClicks;
  int get numClicks => _numClicks ?? 0;
  bool hasNumClicks() => _numClicks != null;

  // "num_redemptions" field.
  int? _numRedemptions;
  int get numRedemptions => _numRedemptions ?? 0;
  bool hasNumRedemptions() => _numRedemptions != null;

  // "deal_type" field.
  String? _dealType;
  String get dealType => _dealType ?? '';
  bool hasDealType() => _dealType != null;

  // "deal_tier" field.
  String? _dealTier;
  String get dealTier => _dealTier ?? '';
  bool hasDealTier() => _dealTier != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "recurrence" field.
  String? _recurrence;
  String get recurrence => _recurrence ?? '';
  bool hasRecurrence() => _recurrence != null;

  // "deal_hours" field.
  String? _dealHours;
  String get dealHours => _dealHours ?? '';
  bool hasDealHours() => _dealHours != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "start_moment" field.
  DateTime? _startMoment;
  DateTime? get startMoment => _startMoment;
  bool hasStartMoment() => _startMoment != null;

  // "end_moment" field.
  DateTime? _endMoment;
  DateTime? get endMoment => _endMoment;
  bool hasEndMoment() => _endMoment != null;

  // "deal_id" field.
  String? _dealId;
  String get dealId => _dealId ?? '';
  bool hasDealId() => _dealId != null;

  // "temp_address" field.
  String? _tempAddress;
  String get tempAddress => _tempAddress ?? '';
  bool hasTempAddress() => _tempAddress != null;

  // "moment_made" field.
  DateTime? _momentMade;
  DateTime? get momentMade => _momentMade;
  bool hasMomentMade() => _momentMade != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _numClicks = castToType<int>(snapshotData['num_clicks']);
    _numRedemptions = castToType<int>(snapshotData['num_redemptions']);
    _dealType = snapshotData['deal_type'] as String?;
    _dealTier = snapshotData['deal_tier'] as String?;
    _category = snapshotData['category'] as String?;
    _recurrence = snapshotData['recurrence'] as String?;
    _dealHours = snapshotData['deal_hours'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _startMoment = snapshotData['start_moment'] as DateTime?;
    _endMoment = snapshotData['end_moment'] as DateTime?;
    _dealId = snapshotData['deal_id'] as String?;
    _tempAddress = snapshotData['temp_address'] as String?;
    _momentMade = snapshotData['moment_made'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ExpiredDeals');

  static Stream<ExpiredDealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpiredDealsRecord.fromSnapshot(s));

  static Future<ExpiredDealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpiredDealsRecord.fromSnapshot(s));

  static ExpiredDealsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpiredDealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpiredDealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpiredDealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpiredDealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpiredDealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpiredDealsRecordData({
  String? title,
  String? description,
  String? image,
  int? numClicks,
  int? numRedemptions,
  String? dealType,
  String? dealTier,
  String? category,
  String? recurrence,
  String? dealHours,
  String? businessName,
  DateTime? startMoment,
  DateTime? endMoment,
  String? dealId,
  String? tempAddress,
  DateTime? momentMade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'num_clicks': numClicks,
      'num_redemptions': numRedemptions,
      'deal_type': dealType,
      'deal_tier': dealTier,
      'category': category,
      'recurrence': recurrence,
      'deal_hours': dealHours,
      'business_name': businessName,
      'start_moment': startMoment,
      'end_moment': endMoment,
      'deal_id': dealId,
      'temp_address': tempAddress,
      'moment_made': momentMade,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpiredDealsRecordDocumentEquality
    implements Equality<ExpiredDealsRecord> {
  const ExpiredDealsRecordDocumentEquality();

  @override
  bool equals(ExpiredDealsRecord? e1, ExpiredDealsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.numClicks == e2?.numClicks &&
        e1?.numRedemptions == e2?.numRedemptions &&
        e1?.dealType == e2?.dealType &&
        e1?.dealTier == e2?.dealTier &&
        e1?.category == e2?.category &&
        e1?.recurrence == e2?.recurrence &&
        e1?.dealHours == e2?.dealHours &&
        e1?.businessName == e2?.businessName &&
        e1?.startMoment == e2?.startMoment &&
        e1?.endMoment == e2?.endMoment &&
        e1?.dealId == e2?.dealId &&
        e1?.tempAddress == e2?.tempAddress &&
        e1?.momentMade == e2?.momentMade;
  }

  @override
  int hash(ExpiredDealsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.image,
        e?.numClicks,
        e?.numRedemptions,
        e?.dealType,
        e?.dealTier,
        e?.category,
        e?.recurrence,
        e?.dealHours,
        e?.businessName,
        e?.startMoment,
        e?.endMoment,
        e?.dealId,
        e?.tempAddress,
        e?.momentMade
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpiredDealsRecord;
}
