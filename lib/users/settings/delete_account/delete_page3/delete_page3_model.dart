import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'delete_page3_widget.dart' show DeletePage3Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeletePage3Model extends FlutterFlowModel<DeletePage3Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for deleteacc widget.
  FocusNode? deleteaccFocusNode;
  TextEditingController? deleteaccTextController;
  String? Function(BuildContext, String?)? deleteaccTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? redemlyRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WhyUsersDeleteAccountRecord? deletedUserComment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    deleteaccFocusNode?.dispose();
    deleteaccTextController?.dispose();
  }
}
