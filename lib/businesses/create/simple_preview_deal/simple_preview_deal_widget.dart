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
import 'simple_preview_deal_model.dart';
export 'simple_preview_deal_model.dart';

class SimplePreviewDealWidget extends StatefulWidget {
  const SimplePreviewDealWidget({
    super.key,
    required this.title,
    required this.image,
    required this.startMoment,
    required this.endMoment,
    required this.recurrence,
    required this.dealHours,
    required this.dealType,
    this.tempAddy,
  });

  final String? title;
  final String? image;
  final DateTime? startMoment;
  final DateTime? endMoment;
  final String? recurrence;
  final String? dealHours;
  final String? dealType;
  final String? tempAddy;

  @override
  State<SimplePreviewDealWidget> createState() =>
      _SimplePreviewDealWidgetState();
}

class _SimplePreviewDealWidgetState extends State<SimplePreviewDealWidget> {
  late SimplePreviewDealModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimplePreviewDealModel());

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
                logFirebaseEvent('SIMPLE_PREVIEW_DEAL_APPROVE_AND_POST_BTN');
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
                    description: '',
                    image: widget!.image,
                    availableRedemptions: 1000000,
                    numClicks: 0,
                    numRedemptions: 0,
                    dealType: widget!.dealType,
                    dealTier: 'All',
                    category: valueOrDefault(
                        currentUserDocument?.businessCategory, ''),
                    recurrence: widget!.recurrence,
                    dealHours: widget!.dealHours,
                    businessName: currentUserDisplayName,
                    startTime: functions.getMidnightTime(),
                    endTime: functions.getBeforeMidnightTime(),
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
                _model.simpleDealMade = DealsRecord.getDocumentFromData({
                  ...createDealsRecordData(
                    businessRef: currentUserReference,
                    title: widget!.title,
                    description: '',
                    image: widget!.image,
                    availableRedemptions: 1000000,
                    numClicks: 0,
                    numRedemptions: 0,
                    dealType: widget!.dealType,
                    dealTier: 'All',
                    category: valueOrDefault(
                        currentUserDocument?.businessCategory, ''),
                    recurrence: widget!.recurrence,
                    dealHours: widget!.dealHours,
                    businessName: currentUserDisplayName,
                    startTime: functions.getMidnightTime(),
                    endTime: functions.getBeforeMidnightTime(),
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

                await _model.simpleDealMade!.reference
                    .update(createDealsRecordData(
                  dealId: _model.simpleDealMade?.reference.id,
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
                logFirebaseEvent('SIMPLE_PREVIEW_DEAL_CANCEL_AND_EDIT_BTN_');
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
