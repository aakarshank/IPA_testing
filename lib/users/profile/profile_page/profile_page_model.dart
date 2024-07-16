import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/customer_nav_bar/customer_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  List<DealsRecord> userBirthdayDeals = [];
  void addToUserBirthdayDeals(DealsRecord item) => userBirthdayDeals.add(item);
  void removeFromUserBirthdayDeals(DealsRecord item) =>
      userBirthdayDeals.remove(item);
  void removeAtIndexFromUserBirthdayDeals(int index) =>
      userBirthdayDeals.removeAt(index);
  void insertAtIndexInUserBirthdayDeals(int index, DealsRecord item) =>
      userBirthdayDeals.insert(index, item);
  void updateUserBirthdayDealsAtIndex(
          int index, Function(DealsRecord) updateFn) =>
      userBirthdayDeals[index] = updateFn(userBirthdayDeals[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ProfilePage widget.
  List<DealsRecord>? allBdayDeals;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for CustomerNavBar component.
  late CustomerNavBarModel customerNavBarModel;

  /// Query cache managers for this widget.

  final _userRecentRedemptionsManager =
      StreamRequestManager<List<RedemptionHistoryRecord>>();
  Stream<List<RedemptionHistoryRecord>> userRecentRedemptions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RedemptionHistoryRecord>> Function() requestFn,
  }) =>
      _userRecentRedemptionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserRecentRedemptionsCache() =>
      _userRecentRedemptionsManager.clear();
  void clearUserRecentRedemptionsCacheKey(String? uniqueKey) =>
      _userRecentRedemptionsManager.clearRequest(uniqueKey);

  final _userFavoriteDealsCacheManager =
      StreamRequestManager<List<DealsRecord>>();
  Stream<List<DealsRecord>> userFavoriteDealsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DealsRecord>> Function() requestFn,
  }) =>
      _userFavoriteDealsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserFavoriteDealsCacheCache() =>
      _userFavoriteDealsCacheManager.clear();
  void clearUserFavoriteDealsCacheCacheKey(String? uniqueKey) =>
      _userFavoriteDealsCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    customerNavBarModel = createModel(context, () => CustomerNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    customerNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearUserRecentRedemptionsCache();

    clearUserFavoriteDealsCacheCache();
  }
}
