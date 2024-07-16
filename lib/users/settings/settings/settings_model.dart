import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/customer_nav_bar/customer_nav_bar_widget.dart';
import '/users/settings/delete_account/delete_page1/delete_page1_widget.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CustomerNavBar component.
  late CustomerNavBarModel customerNavBarModel;

  @override
  void initState(BuildContext context) {
    customerNavBarModel = createModel(context, () => CustomerNavBarModel());
  }

  @override
  void dispose() {
    customerNavBarModel.dispose();
  }
}
