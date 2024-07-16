import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _pushNotis = prefs.getBool('ff_pushNotis') ?? _pushNotis;
    });
    _safeInit(() {
      _textNotis = prefs.getBool('ff_textNotis') ?? _textNotis;
    });
    _safeInit(() {
      _emailNotis = prefs.getBool('ff_emailNotis') ?? _emailNotis;
    });
    _safeInit(() {
      _favoriteBusinesses =
          prefs.getStringList('ff_favoriteBusinesses') ?? _favoriteBusinesses;
    });
    _safeInit(() {
      _lastBronzeMinEdit = prefs.containsKey('ff_lastBronzeMinEdit')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastBronzeMinEdit')!)
          : _lastBronzeMinEdit;
    });
    _safeInit(() {
      _lastSilverMinEdit = prefs.containsKey('ff_lastSilverMinEdit')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastSilverMinEdit')!)
          : _lastSilverMinEdit;
    });
    _safeInit(() {
      _lastGoldMinEdit = prefs.containsKey('ff_lastGoldMinEdit')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastGoldMinEdit')!)
          : _lastGoldMinEdit;
    });
    _safeInit(() {
      _favoriteDeals =
          prefs.getStringList('ff_favoriteDeals') ?? _favoriteDeals;
    });
    _safeInit(() {
      _dealClicksList = prefs
              .getStringList('ff_dealClicksList')
              ?.map((path) => path.ref)
              .toList() ??
          _dealClicksList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _pushNotis = false;
  bool get pushNotis => _pushNotis;
  set pushNotis(bool value) {
    _pushNotis = value;
    prefs.setBool('ff_pushNotis', value);
  }

  bool _textNotis = false;
  bool get textNotis => _textNotis;
  set textNotis(bool value) {
    _textNotis = value;
    prefs.setBool('ff_textNotis', value);
  }

  bool _emailNotis = false;
  bool get emailNotis => _emailNotis;
  set emailNotis(bool value) {
    _emailNotis = value;
    prefs.setBool('ff_emailNotis', value);
  }

  List<String> _favoriteBusinesses = [];
  List<String> get favoriteBusinesses => _favoriteBusinesses;
  set favoriteBusinesses(List<String> value) {
    _favoriteBusinesses = value;
    prefs.setStringList('ff_favoriteBusinesses', value);
  }

  void addToFavoriteBusinesses(String value) {
    favoriteBusinesses.add(value);
    prefs.setStringList('ff_favoriteBusinesses', _favoriteBusinesses);
  }

  void removeFromFavoriteBusinesses(String value) {
    favoriteBusinesses.remove(value);
    prefs.setStringList('ff_favoriteBusinesses', _favoriteBusinesses);
  }

  void removeAtIndexFromFavoriteBusinesses(int index) {
    favoriteBusinesses.removeAt(index);
    prefs.setStringList('ff_favoriteBusinesses', _favoriteBusinesses);
  }

  void updateFavoriteBusinessesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favoriteBusinesses[index] = updateFn(_favoriteBusinesses[index]);
    prefs.setStringList('ff_favoriteBusinesses', _favoriteBusinesses);
  }

  void insertAtIndexInFavoriteBusinesses(int index, String value) {
    favoriteBusinesses.insert(index, value);
    prefs.setStringList('ff_favoriteBusinesses', _favoriteBusinesses);
  }

  DateTime? _lastBronzeMinEdit =
      DateTime.fromMillisecondsSinceEpoch(1718148600000);
  DateTime? get lastBronzeMinEdit => _lastBronzeMinEdit;
  set lastBronzeMinEdit(DateTime? value) {
    _lastBronzeMinEdit = value;
    value != null
        ? prefs.setInt('ff_lastBronzeMinEdit', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastBronzeMinEdit');
  }

  DateTime? _lastSilverMinEdit =
      DateTime.fromMillisecondsSinceEpoch(1718148600000);
  DateTime? get lastSilverMinEdit => _lastSilverMinEdit;
  set lastSilverMinEdit(DateTime? value) {
    _lastSilverMinEdit = value;
    value != null
        ? prefs.setInt('ff_lastSilverMinEdit', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastSilverMinEdit');
  }

  DateTime? _lastGoldMinEdit =
      DateTime.fromMillisecondsSinceEpoch(1718148600000);
  DateTime? get lastGoldMinEdit => _lastGoldMinEdit;
  set lastGoldMinEdit(DateTime? value) {
    _lastGoldMinEdit = value;
    value != null
        ? prefs.setInt('ff_lastGoldMinEdit', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastGoldMinEdit');
  }

  List<String> _favoriteDeals = [];
  List<String> get favoriteDeals => _favoriteDeals;
  set favoriteDeals(List<String> value) {
    _favoriteDeals = value;
    prefs.setStringList('ff_favoriteDeals', value);
  }

  void addToFavoriteDeals(String value) {
    favoriteDeals.add(value);
    prefs.setStringList('ff_favoriteDeals', _favoriteDeals);
  }

  void removeFromFavoriteDeals(String value) {
    favoriteDeals.remove(value);
    prefs.setStringList('ff_favoriteDeals', _favoriteDeals);
  }

  void removeAtIndexFromFavoriteDeals(int index) {
    favoriteDeals.removeAt(index);
    prefs.setStringList('ff_favoriteDeals', _favoriteDeals);
  }

  void updateFavoriteDealsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favoriteDeals[index] = updateFn(_favoriteDeals[index]);
    prefs.setStringList('ff_favoriteDeals', _favoriteDeals);
  }

  void insertAtIndexInFavoriteDeals(int index, String value) {
    favoriteDeals.insert(index, value);
    prefs.setStringList('ff_favoriteDeals', _favoriteDeals);
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  List<DocumentReference> _dealClicksList = [];
  List<DocumentReference> get dealClicksList => _dealClicksList;
  set dealClicksList(List<DocumentReference> value) {
    _dealClicksList = value;
    prefs.setStringList('ff_dealClicksList', value.map((x) => x.path).toList());
  }

  void addToDealClicksList(DocumentReference value) {
    dealClicksList.add(value);
    prefs.setStringList(
        'ff_dealClicksList', _dealClicksList.map((x) => x.path).toList());
  }

  void removeFromDealClicksList(DocumentReference value) {
    dealClicksList.remove(value);
    prefs.setStringList(
        'ff_dealClicksList', _dealClicksList.map((x) => x.path).toList());
  }

  void removeAtIndexFromDealClicksList(int index) {
    dealClicksList.removeAt(index);
    prefs.setStringList(
        'ff_dealClicksList', _dealClicksList.map((x) => x.path).toList());
  }

  void updateDealClicksListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    dealClicksList[index] = updateFn(_dealClicksList[index]);
    prefs.setStringList(
        'ff_dealClicksList', _dealClicksList.map((x) => x.path).toList());
  }

  void insertAtIndexInDealClicksList(int index, DocumentReference value) {
    dealClicksList.insert(index, value);
    prefs.setStringList(
        'ff_dealClicksList', _dealClicksList.map((x) => x.path).toList());
  }

  final _tierAllDealsManager = StreamRequestManager<List<DealsRecord>>();
  Stream<List<DealsRecord>> tierAllDeals({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DealsRecord>> Function() requestFn,
  }) =>
      _tierAllDealsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTierAllDealsCache() => _tierAllDealsManager.clear();
  void clearTierAllDealsCacheKey(String? uniqueKey) =>
      _tierAllDealsManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
