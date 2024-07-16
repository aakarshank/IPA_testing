import '/auth/firebase_auth/auth_util.dart';
import '/backend/firebase_storage/storage.dart';
import '/businesses/create/preview_deal/preview_deal_widget.dart';
import '/businesses/create/simple_preview_deal/simple_preview_deal_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/nav_bars/business_nav_bar/business_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_deal_widget.dart' show CreateDealWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateDealModel extends FlutterFlowModel<CreateDealWidget> {
  ///  Local state fields for this page.

  bool everyDay = true;

  bool allBusinessHours = true;

  bool noLimit = true;

  DateTime? startTime;

  DateTime? endTime;

  DateTime? simpleStartMoment;

  DateTime? simpleEndMoment;

  DateTime? detailStartMoment;

  DateTime? detailEndMoment;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for simpleTitle widget.
  FocusNode? simpleTitleFocusNode;
  TextEditingController? simpleTitleTextController;
  String? Function(BuildContext, String?)? simpleTitleTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for simpleTypeDrop widget.
  String? simpleTypeDropValue;
  FormFieldController<String>? simpleTypeDropValueController;
  // State field(s) for simpleAddy widget.
  FocusNode? simpleAddyFocusNode;
  TextEditingController? simpleAddyTextController;
  String? Function(BuildContext, String?)? simpleAddyTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for detailTitle widget.
  FocusNode? detailTitleFocusNode;
  TextEditingController? detailTitleTextController;
  String? Function(BuildContext, String?)? detailTitleTextControllerValidator;
  // State field(s) for detailDescr widget.
  FocusNode? detailDescrFocusNode;
  TextEditingController? detailDescrTextController;
  String? Function(BuildContext, String?)? detailDescrTextControllerValidator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  DateTime? datePicked5;
  DateTime? datePicked6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for dealLimit widget.
  FocusNode? dealLimitFocusNode;
  TextEditingController? dealLimitTextController;
  String? Function(BuildContext, String?)? dealLimitTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for categoryDrop widget.
  String? categoryDropValue;
  FormFieldController<String>? categoryDropValueController;
  // State field(s) for typeDrop widget.
  String? typeDropValue;
  FormFieldController<String>? typeDropValueController;
  // State field(s) for tierDrop widget.
  String? tierDropValue;
  FormFieldController<String>? tierDropValueController;
  // State field(s) for detailedAddy widget.
  FocusNode? detailedAddyFocusNode;
  TextEditingController? detailedAddyTextController;
  String? Function(BuildContext, String?)? detailedAddyTextControllerValidator;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Model for BusinessNavBar component.
  late BusinessNavBarModel businessNavBarModel;

  @override
  void initState(BuildContext context) {
    businessNavBarModel = createModel(context, () => BusinessNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    simpleTitleFocusNode?.dispose();
    simpleTitleTextController?.dispose();

    simpleAddyFocusNode?.dispose();
    simpleAddyTextController?.dispose();

    detailTitleFocusNode?.dispose();
    detailTitleTextController?.dispose();

    detailDescrFocusNode?.dispose();
    detailDescrTextController?.dispose();

    dealLimitFocusNode?.dispose();
    dealLimitTextController?.dispose();

    detailedAddyFocusNode?.dispose();
    detailedAddyTextController?.dispose();

    businessNavBarModel.dispose();
  }
}
