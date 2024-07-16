import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/customer_nav_bar/customer_nav_bar_widget.dart';
import '/users/explore/business_selected/business_selected_widget.dart';
import '/users/explore/search_page/search_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for CustomerNavBar component.
  late CustomerNavBarModel customerNavBarModel;

  @override
  void initState(BuildContext context) {
    customerNavBarModel = createModel(context, () => CustomerNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customerNavBarModel.dispose();
  }
}
