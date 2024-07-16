import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'founder_dash_widget.dart' show FounderDashWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FounderDashModel extends FlutterFlowModel<FounderDashWidget> {
  ///  Local state fields for this page.

  List<DealsRecord> expiredDeals = [];
  void addToExpiredDeals(DealsRecord item) => expiredDeals.add(item);
  void removeFromExpiredDeals(DealsRecord item) => expiredDeals.remove(item);
  void removeAtIndexFromExpiredDeals(int index) => expiredDeals.removeAt(index);
  void insertAtIndexInExpiredDeals(int index, DealsRecord item) =>
      expiredDeals.insert(index, item);
  void updateExpiredDealsAtIndex(int index, Function(DealsRecord) updateFn) =>
      expiredDeals[index] = updateFn(expiredDeals[index]);

  List<WhyUsersDeleteAccountRecord> userDeletes = [];
  void addToUserDeletes(WhyUsersDeleteAccountRecord item) =>
      userDeletes.add(item);
  void removeFromUserDeletes(WhyUsersDeleteAccountRecord item) =>
      userDeletes.remove(item);
  void removeAtIndexFromUserDeletes(int index) => userDeletes.removeAt(index);
  void insertAtIndexInUserDeletes(
          int index, WhyUsersDeleteAccountRecord item) =>
      userDeletes.insert(index, item);
  void updateUserDeletesAtIndex(
          int index, Function(WhyUsersDeleteAccountRecord) updateFn) =>
      userDeletes[index] = updateFn(userDeletes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in FounderDash widget.
  List<DealsRecord>? allDeals;
  // Stores action output result for [Firestore Query - Query a collection] action in FounderDash widget.
  List<WhyUsersDeleteAccountRecord>? userDeletesQuery;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
