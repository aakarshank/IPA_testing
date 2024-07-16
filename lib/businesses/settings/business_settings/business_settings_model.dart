import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/businesses/settings/business_delete_acc/business_delete1/business_delete1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/business_nav_bar/business_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'business_settings_widget.dart' show BusinessSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusinessSettingsModel extends FlutterFlowModel<BusinessSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<DealsRecord>? businessDeals;
  // Model for BusinessNavBar component.
  late BusinessNavBarModel businessNavBarModel;

  @override
  void initState(BuildContext context) {
    businessNavBarModel = createModel(context, () => BusinessNavBarModel());
  }

  @override
  void dispose() {
    businessNavBarModel.dispose();
  }
}
