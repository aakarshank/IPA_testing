import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'preview_deal_widget.dart' show PreviewDealWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PreviewDealModel extends FlutterFlowModel<PreviewDealWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? redemlyRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DealsRecord? newDetailedDeal;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
