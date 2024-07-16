import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'favorited_businesses_widget.dart' show FavoritedBusinessesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritedBusinessesModel
    extends FlutterFlowModel<FavoritedBusinessesWidget> {
  ///  Local state fields for this page.

  List<ExploreMapRecord> favoriteBusinesses = [];
  void addToFavoriteBusinesses(ExploreMapRecord item) =>
      favoriteBusinesses.add(item);
  void removeFromFavoriteBusinesses(ExploreMapRecord item) =>
      favoriteBusinesses.remove(item);
  void removeAtIndexFromFavoriteBusinesses(int index) =>
      favoriteBusinesses.removeAt(index);
  void insertAtIndexInFavoriteBusinesses(int index, ExploreMapRecord item) =>
      favoriteBusinesses.insert(index, item);
  void updateFavoriteBusinessesAtIndex(
          int index, Function(ExploreMapRecord) updateFn) =>
      favoriteBusinesses[index] = updateFn(favoriteBusinesses[index]);

  int containerHeight = 1000;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in FavoritedBusinesses widget.
  List<ExploreMapRecord>? favoriteBusinessDocs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
