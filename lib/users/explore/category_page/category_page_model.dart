import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/customer_nav_bar/customer_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'category_page_widget.dart' show CategoryPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryPageModel extends FlutterFlowModel<CategoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CustomerNavBar component.
  late CustomerNavBarModel customerNavBarModel;

  /// Query cache managers for this widget.

  final _categoryDealsManager = StreamRequestManager<List<DealsRecord>>();
  Stream<List<DealsRecord>> categoryDeals({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DealsRecord>> Function() requestFn,
  }) =>
      _categoryDealsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryDealsCache() => _categoryDealsManager.clear();
  void clearCategoryDealsCacheKey(String? uniqueKey) =>
      _categoryDealsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    customerNavBarModel = createModel(context, () => CustomerNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customerNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearCategoryDealsCache();
  }
}
