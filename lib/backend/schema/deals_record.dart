import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DealsRecord extends FirestoreRecord {
  DealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businessRef" field.
  DocumentReference? _businessRef;
  DocumentReference? get businessRef => _businessRef;
  bool hasBusinessRef() => _businessRef != null;

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

  // "available_redemptions" field.
  int? _availableRedemptions;
  int get availableRedemptions => _availableRedemptions ?? 0;
  bool hasAvailableRedemptions() => _availableRedemptions != null;

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

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "business_hours" field.
  String? _businessHours;
  String get businessHours => _businessHours ?? '';
  bool hasBusinessHours() => _businessHours != null;

  // "business_phone" field.
  String? _businessPhone;
  String get businessPhone => _businessPhone ?? '';
  bool hasBusinessPhone() => _businessPhone != null;

  // "redeemed_by" field.
  List<DocumentReference>? _redeemedBy;
  List<DocumentReference> get redeemedBy => _redeemedBy ?? const [];
  bool hasRedeemedBy() => _redeemedBy != null;

  // "start_moment" field.
  DateTime? _startMoment;
  DateTime? get startMoment => _startMoment;
  bool hasStartMoment() => _startMoment != null;

  // "end_moment" field.
  DateTime? _endMoment;
  DateTime? get endMoment => _endMoment;
  bool hasEndMoment() => _endMoment != null;

  // "business_locations" field.
  List<LatLng>? _businessLocations;
  List<LatLng> get businessLocations => _businessLocations ?? const [];
  bool hasBusinessLocations() => _businessLocations != null;

  // "business_addresses" field.
  List<String>? _businessAddresses;
  List<String> get businessAddresses => _businessAddresses ?? const [];
  bool hasBusinessAddresses() => _businessAddresses != null;

  // "deal_id" field.
  String? _dealId;
  String get dealId => _dealId ?? '';
  bool hasDealId() => _dealId != null;

  // "checkLocation" field.
  bool? _checkLocation;
  bool get checkLocation => _checkLocation ?? false;
  bool hasCheckLocation() => _checkLocation != null;

  // "temp_address" field.
  String? _tempAddress;
  String get tempAddress => _tempAddress ?? '';
  bool hasTempAddress() => _tempAddress != null;

  // "moment_made" field.
  DateTime? _momentMade;
  DateTime? get momentMade => _momentMade;
  bool hasMomentMade() => _momentMade != null;

  // "founderRef" field.
  DocumentReference? _founderRef;
  DocumentReference? get founderRef => _founderRef;
  bool hasFounderRef() => _founderRef != null;

  void _initializeFields() {
    _businessRef = snapshotData['businessRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _availableRedemptions =
        castToType<int>(snapshotData['available_redemptions']);
    _numClicks = castToType<int>(snapshotData['num_clicks']);
    _numRedemptions = castToType<int>(snapshotData['num_redemptions']);
    _dealType = snapshotData['deal_type'] as String?;
    _dealTier = snapshotData['deal_tier'] as String?;
    _category = snapshotData['category'] as String?;
    _recurrence = snapshotData['recurrence'] as String?;
    _dealHours = snapshotData['deal_hours'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _businessHours = snapshotData['business_hours'] as String?;
    _businessPhone = snapshotData['business_phone'] as String?;
    _redeemedBy = getDataList(snapshotData['redeemed_by']);
    _startMoment = snapshotData['start_moment'] as DateTime?;
    _endMoment = snapshotData['end_moment'] as DateTime?;
    _businessLocations = getDataList(snapshotData['business_locations']);
    _businessAddresses = getDataList(snapshotData['business_addresses']);
    _dealId = snapshotData['deal_id'] as String?;
    _checkLocation = snapshotData['checkLocation'] as bool?;
    _tempAddress = snapshotData['temp_address'] as String?;
    _momentMade = snapshotData['moment_made'] as DateTime?;
    _founderRef = snapshotData['founderRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Deals');

  static Stream<DealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DealsRecord.fromSnapshot(s));

  static Future<DealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DealsRecord.fromSnapshot(s));

  static DealsRecord fromSnapshot(DocumentSnapshot snapshot) => DealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDealsRecordData({
  DocumentReference? businessRef,
  String? title,
  String? description,
  String? image,
  int? availableRedemptions,
  int? numClicks,
  int? numRedemptions,
  String? dealType,
  String? dealTier,
  String? category,
  String? recurrence,
  String? dealHours,
  String? businessName,
  DateTime? startTime,
  DateTime? endTime,
  String? businessHours,
  String? businessPhone,
  DateTime? startMoment,
  DateTime? endMoment,
  String? dealId,
  bool? checkLocation,
  String? tempAddress,
  DateTime? momentMade,
  DocumentReference? founderRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'businessRef': businessRef,
      'title': title,
      'description': description,
      'image': image,
      'available_redemptions': availableRedemptions,
      'num_clicks': numClicks,
      'num_redemptions': numRedemptions,
      'deal_type': dealType,
      'deal_tier': dealTier,
      'category': category,
      'recurrence': recurrence,
      'deal_hours': dealHours,
      'business_name': businessName,
      'start_time': startTime,
      'end_time': endTime,
      'business_hours': businessHours,
      'business_phone': businessPhone,
      'start_moment': startMoment,
      'end_moment': endMoment,
      'deal_id': dealId,
      'checkLocation': checkLocation,
      'temp_address': tempAddress,
      'moment_made': momentMade,
      'founderRef': founderRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DealsRecordDocumentEquality implements Equality<DealsRecord> {
  const DealsRecordDocumentEquality();

  @override
  bool equals(DealsRecord? e1, DealsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.businessRef == e2?.businessRef &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.availableRedemptions == e2?.availableRedemptions &&
        e1?.numClicks == e2?.numClicks &&
        e1?.numRedemptions == e2?.numRedemptions &&
        e1?.dealType == e2?.dealType &&
        e1?.dealTier == e2?.dealTier &&
        e1?.category == e2?.category &&
        e1?.recurrence == e2?.recurrence &&
        e1?.dealHours == e2?.dealHours &&
        e1?.businessName == e2?.businessName &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.businessHours == e2?.businessHours &&
        e1?.businessPhone == e2?.businessPhone &&
        listEquality.equals(e1?.redeemedBy, e2?.redeemedBy) &&
        e1?.startMoment == e2?.startMoment &&
        e1?.endMoment == e2?.endMoment &&
        listEquality.equals(e1?.businessLocations, e2?.businessLocations) &&
        listEquality.equals(e1?.businessAddresses, e2?.businessAddresses) &&
        e1?.dealId == e2?.dealId &&
        e1?.checkLocation == e2?.checkLocation &&
        e1?.tempAddress == e2?.tempAddress &&
        e1?.momentMade == e2?.momentMade &&
        e1?.founderRef == e2?.founderRef;
  }

  @override
  int hash(DealsRecord? e) => const ListEquality().hash([
        e?.businessRef,
        e?.title,
        e?.description,
        e?.image,
        e?.availableRedemptions,
        e?.numClicks,
        e?.numRedemptions,
        e?.dealType,
        e?.dealTier,
        e?.category,
        e?.recurrence,
        e?.dealHours,
        e?.businessName,
        e?.startTime,
        e?.endTime,
        e?.businessHours,
        e?.businessPhone,
        e?.redeemedBy,
        e?.startMoment,
        e?.endMoment,
        e?.businessLocations,
        e?.businessAddresses,
        e?.dealId,
        e?.checkLocation,
        e?.tempAddress,
        e?.momentMade,
        e?.founderRef
      ]);

  @override
  bool isValidKey(Object? o) => o is DealsRecord;
}
