import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/business_nav_bar/business_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'deal_history_widget.dart' show DealHistoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DealHistoryModel extends FlutterFlowModel<DealHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BusinessNavBar component.
  late BusinessNavBarModel businessNavBarModel;

  /// Query cache managers for this widget.

  final _businessExpiredDealsManager =
      StreamRequestManager<List<ExpiredDealsRecord>>();
  Stream<List<ExpiredDealsRecord>> businessExpiredDeals({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ExpiredDealsRecord>> Function() requestFn,
  }) =>
      _businessExpiredDealsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBusinessExpiredDealsCache() => _businessExpiredDealsManager.clear();
  void clearBusinessExpiredDealsCacheKey(String? uniqueKey) =>
      _businessExpiredDealsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    businessNavBarModel = createModel(context, () => BusinessNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    businessNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearBusinessExpiredDealsCache();
  }
}
