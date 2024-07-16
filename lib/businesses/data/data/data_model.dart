import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/businesses/data/active_deals/active_deals_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/business_nav_bar/business_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'data_widget.dart' show DataWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DataModel extends FlutterFlowModel<DataWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BusinessNavBar component.
  late BusinessNavBarModel businessNavBarModel;

  /// Query cache managers for this widget.

  final _businessActiveDealsManager = StreamRequestManager<List<DealsRecord>>();
  Stream<List<DealsRecord>> businessActiveDeals({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DealsRecord>> Function() requestFn,
  }) =>
      _businessActiveDealsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBusinessActiveDealsCache() => _businessActiveDealsManager.clear();
  void clearBusinessActiveDealsCacheKey(String? uniqueKey) =>
      _businessActiveDealsManager.clearRequest(uniqueKey);

  final _businessTopZipcodesManager =
      StreamRequestManager<List<ZipcodesRecord>>();
  Stream<List<ZipcodesRecord>> businessTopZipcodes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ZipcodesRecord>> Function() requestFn,
  }) =>
      _businessTopZipcodesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBusinessTopZipcodesCache() => _businessTopZipcodesManager.clear();
  void clearBusinessTopZipcodesCacheKey(String? uniqueKey) =>
      _businessTopZipcodesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    businessNavBarModel = createModel(context, () => BusinessNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    businessNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearBusinessActiveDealsCache();

    clearBusinessTopZipcodesCache();
  }
}
