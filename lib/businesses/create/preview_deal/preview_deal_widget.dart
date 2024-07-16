import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'preview_deal_model.dart';
export 'preview_deal_model.dart';

class PreviewDealWidget extends StatefulWidget {
  const PreviewDealWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.availableRedemptions,
    required this.dealType,
    required this.dealTier,
    required this.category,
    required this.recurrence,
    required this.dealHours,
    required this.startTime,
    required this.endTime,
    required this.startMoment,
    required this.endMoment,
    this.tempAddy,
  });

  final String? title;
  final String? description;
  final String? image;
  final int? availableRedemptions;
  final String? dealType;
  final String? dealTier;
  final String? category;
  final String? recurrence;
  final String? dealHours;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? startMoment;
  final DateTime? endMoment;
  final String? tempAddy;

  @override
  State<PreviewDealWidget> createState() => _PreviewDealWidgetState();
}

class _PreviewDealWidgetState extends State<PreviewDealWidget> {
  late PreviewDealModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreviewDealModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
            child: Text(
              'Here is what your deal will look like!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 375.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 365.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              widget!.image!,
                              width: double.infinity,
                              height: 145.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: 0.9,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          height: 20.0,
                                          constraints: BoxConstraints(
                                            maxWidth: 140.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF9DF9D1),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                              topLeft: Radius.circular(5.0),
                                              topRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget!.recurrence,
                                                'recurrence',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.9,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 2.0, 0.0, 0.0),
                                        child: Container(
                                          height: 20.0,
                                          constraints: BoxConstraints(
                                            maxWidth: 140.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF9DF9D1),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                              topLeft: Radius.circular(5.0),
                                              topRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget!.dealHours,
                                                'dealHours',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.title,
                          'dealTitle',
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Outfit',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          currentUserDisplayName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PREVIEW_DEAL_APPROVE_AND_POST_BTN_ON_TAP');
                _model.redemlyRef = await queryUsersRecordOnce(
                  queryBuilder: (usersRecord) => usersRecord.where(
                    'email',
                    isEqualTo: 'info.redemly@gmail.com',
                  ),
                  singleRecord: true,
                ).then((s) => s.firstOrNull);

                var dealsRecordReference = DealsRecord.collection.doc();
                await dealsRecordReference.set({
                  ...createDealsRecordData(
                    businessRef: currentUserReference,
                    title: widget!.title,
                    description: widget!.description,
                    image: widget!.image,
                    availableRedemptions: widget!.availableRedemptions,
                    numClicks: 0,
                    numRedemptions: 0,
                    dealType: widget!.dealType,
                    dealTier: widget!.dealTier,
                    category: widget!.category,
                    recurrence: widget!.recurrence,
                    dealHours: widget!.dealHours,
                    businessName: currentUserDisplayName,
                    startTime: widget!.startTime,
                    endTime: widget!.endTime,
                    businessHours:
                        valueOrDefault(currentUserDocument?.businessHours, ''),
                    businessPhone: currentPhoneNumber,
                    startMoment: widget!.startMoment,
                    endMoment: widget!.endMoment,
                    checkLocation: functions.doesDealCheckLocation(
                        valueOrDefault<bool>(
                            currentUserDocument?.businessMovesAround, false),
                        valueOrDefault<bool>(
                            currentUserDocument?.businessIsService, false)),
                    momentMade: getCurrentTimestamp,
                    tempAddress: widget!.tempAddy,
                    founderRef: _model.redemlyRef?.reference,
                  ),
                  ...mapToFirestore(
                    {
                      'redeemed_by': functions.initializeRedeemedBy(),
                      'business_locations': convertToGeoPointList(
                          (currentUserDocument?.businessAllLocations
                                  ?.toList() ??
                              [])),
                      'business_addresses': (currentUserDocument
                              ?.businessAllAddresses
                              ?.toList() ??
                          []),
                    },
                  ),
                });
                _model.newDetailedDeal = DealsRecord.getDocumentFromData({
                  ...createDealsRecordData(
                    businessRef: currentUserReference,
                    title: widget!.title,
                    description: widget!.description,
                    image: widget!.image,
                    availableRedemptions: widget!.availableRedemptions,
                    numClicks: 0,
                    numRedemptions: 0,
                    dealType: widget!.dealType,
                    dealTier: widget!.dealTier,
                    category: widget!.category,
                    recurrence: widget!.recurrence,
                    dealHours: widget!.dealHours,
                    businessName: currentUserDisplayName,
                    startTime: widget!.startTime,
                    endTime: widget!.endTime,
                    businessHours:
                        valueOrDefault(currentUserDocument?.businessHours, ''),
                    businessPhone: currentPhoneNumber,
                    startMoment: widget!.startMoment,
                    endMoment: widget!.endMoment,
                    checkLocation: functions.doesDealCheckLocation(
                        valueOrDefault<bool>(
                            currentUserDocument?.businessMovesAround, false),
                        valueOrDefault<bool>(
                            currentUserDocument?.businessIsService, false)),
                    momentMade: getCurrentTimestamp,
                    tempAddress: widget!.tempAddy,
                    founderRef: _model.redemlyRef?.reference,
                  ),
                  ...mapToFirestore(
                    {
                      'redeemed_by': functions.initializeRedeemedBy(),
                      'business_locations': convertToGeoPointList(
                          (currentUserDocument?.businessAllLocations
                                  ?.toList() ??
                              [])),
                      'business_addresses': (currentUserDocument
                              ?.businessAllAddresses
                              ?.toList() ??
                          []),
                    },
                  ),
                }, dealsRecordReference);

                await _model.newDetailedDeal!.reference
                    .update(createDealsRecordData(
                  dealId: _model.newDetailedDeal?.reference.id,
                ));

                context.goNamed('DealSuccess');

                setState(() {});
              },
              text: 'Approve and Post',
              options: FFButtonOptions(
                width: double.infinity,
                height: 44.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 15.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PREVIEW_DEAL_CANCEL_AND_EDIT_BTN_ON_TAP');
                Navigator.pop(context);
              },
              text: 'Cancel and Edit',
              options: FFButtonOptions(
                width: double.infinity,
                height: 44.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
