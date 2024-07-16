import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/explore/deal_processed/deal_processed_widget.dart';
import 'redemption_authorize_widget.dart' show RedemptionAuthorizeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RedemptionAuthorizeModel
    extends FlutterFlowModel<RedemptionAuthorizeWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RedemptionHistoryRecord? userRedemptionDocMade;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? redeemedBusiness;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ZipcodesRecord? matchedZip;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
