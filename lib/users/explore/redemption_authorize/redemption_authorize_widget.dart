import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/explore/deal_processed/deal_processed_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'redemption_authorize_model.dart';
export 'redemption_authorize_model.dart';

class RedemptionAuthorizeWidget extends StatefulWidget {
  const RedemptionAuthorizeWidget({
    super.key,
    required this.dealRedeemed,
    required this.dealCategory,
  });

  final DealsRecord? dealRedeemed;
  final String? dealCategory;

  @override
  State<RedemptionAuthorizeWidget> createState() =>
      _RedemptionAuthorizeWidgetState();
}

class _RedemptionAuthorizeWidgetState extends State<RedemptionAuthorizeWidget> {
  late RedemptionAuthorizeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedemptionAuthorizeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: 295.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 7.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  -2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 333.0,
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.dealRedeemed?.title,
                        'title',
                      ),
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
              if (widget!.dealRedeemed?.description != null &&
                  widget!.dealRedeemed?.description != '')
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.dealRedeemed?.description,
                      'description',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 16.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'REDEMPTION_AUTHORIZE_STORE_MEMBER_AUTHOR');

                    var redemptionHistoryRecordReference =
                        RedemptionHistoryRecord.createDoc(
                            currentUserReference!);
                    await redemptionHistoryRecordReference
                        .set(createRedemptionHistoryRecordData(
                      whenRedeemed: getCurrentTimestamp,
                      userName: currentUserDisplayName,
                      userID: currentUserUid,
                      dealTitle: widget!.dealRedeemed?.title,
                      dealImage: widget!.dealRedeemed?.image,
                      businessName: widget!.dealRedeemed?.businessName,
                      userRef: currentUserReference,
                    ));
                    _model.userRedemptionDocMade =
                        RedemptionHistoryRecord.getDocumentFromData(
                            createRedemptionHistoryRecordData(
                              whenRedeemed: getCurrentTimestamp,
                              userName: currentUserDisplayName,
                              userID: currentUserUid,
                              dealTitle: widget!.dealRedeemed?.title,
                              dealImage: widget!.dealRedeemed?.image,
                              businessName: widget!.dealRedeemed?.businessName,
                              userRef: currentUserReference,
                            ),
                            redemptionHistoryRecordReference);
                    if ((currentUserDocument?.userBusinessesVisited?.toList() ??
                                [])
                            .contains(widget!.dealRedeemed?.businessName) ==
                        true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Processing...',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 0),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                    } else {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_businesses_visited': FieldValue.arrayUnion(
                                [widget!.dealRedeemed?.businessName]),
                          },
                        ),
                      });
                    }

                    await widget!.dealRedeemed!.reference.update({
                      ...mapToFirestore(
                        {
                          'redeemed_by':
                              FieldValue.arrayUnion([currentUserReference]),
                          'num_redemptions': FieldValue.increment(1),
                        },
                      ),
                    });
                    _model.redeemedBusiness = await queryUsersRecordOnce(
                      queryBuilder: (usersRecord) => usersRecord.where(
                        'display_name',
                        isEqualTo: widget!.dealRedeemed?.businessName,
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);

                    await _model.redeemedBusiness!.reference.update({
                      ...mapToFirestore(
                        {
                          'business_num_redemptions': FieldValue.increment(1),
                        },
                      ),
                    });
                    if (widget!.dealRedeemed?.dealType == 'Percentage') {
                      await _model.redeemedBusiness!.reference.update({
                        ...mapToFirestore(
                          {
                            'business_percentage_redemptions':
                                FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealRedeemed?.dealType == 'Cash') {
                      await _model.redeemedBusiness!.reference.update({
                        ...mapToFirestore(
                          {
                            'business_cash_redemptions':
                                FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealRedeemed?.dealType == 'Item') {
                      await _model.redeemedBusiness!.reference.update({
                        ...mapToFirestore(
                          {
                            'business_item_redemptions':
                                FieldValue.increment(1),
                          },
                        ),
                      });
                    } else {
                      await _model.redeemedBusiness!.reference.update({
                        ...mapToFirestore(
                          {
                            'business_other_redemptions':
                                FieldValue.increment(1),
                          },
                        ),
                      });
                    }

                    if (widget!.dealCategory == 'Dining') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_dining_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Apparel') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_apparel_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Lifestyle') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_lifestyle_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Electronics') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_electronics_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Fitness') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_fitness_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Pets') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_pets_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Home & Garden') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_homegarden_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Automotive') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_automotive_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Desserts') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_desserts_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    } else if (widget!.dealCategory == 'Entertainment') {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_entertainment_count': FieldValue.increment(1),
                          },
                        ),
                      });
                    }

                    _model.matchedZip = await queryZipcodesRecordOnce(
                      parent: _model.redeemedBusiness?.reference,
                      queryBuilder: (zipcodesRecord) => zipcodesRecord.where(
                        'zipcode',
                        isEqualTo: valueOrDefault(
                            currentUserDocument?.userZipcode, ''),
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    if (_model.matchedZip != null) {
                      await _model.matchedZip!.reference.update({
                        ...mapToFirestore(
                          {
                            'redemptionsThere': FieldValue.increment(1),
                          },
                        ),
                      });
                      if (valueOrDefault(currentUserDocument?.userAge, 0) <=
                          12) {
                        await _model.redeemedBusiness!.reference.update({
                          ...mapToFirestore(
                            {
                              'business_ageone_redemptions':
                                  FieldValue.increment(1),
                            },
                          ),
                        });
                      } else if ((valueOrDefault(
                                  currentUserDocument?.userAge, 0) >=
                              13) &&
                          (valueOrDefault(currentUserDocument?.userAge, 0) <=
                              17)) {
                        await _model.redeemedBusiness!.reference.update({
                          ...mapToFirestore(
                            {
                              'business_agetwo_redemptions':
                                  FieldValue.increment(1),
                            },
                          ),
                        });
                      } else if ((valueOrDefault(
                                  currentUserDocument?.userAge, 0) >=
                              18) &&
                          (valueOrDefault(currentUserDocument?.userAge, 0) <=
                              24)) {
                        await _model.redeemedBusiness!.reference.update({
                          ...mapToFirestore(
                            {
                              'business_agethree_redemptions':
                                  FieldValue.increment(1),
                            },
                          ),
                        });
                      } else if ((valueOrDefault(
                                  currentUserDocument?.userAge, 0) >=
                              25) &&
                          (valueOrDefault(currentUserDocument?.userAge, 0) <=
                              34)) {
                        await _model.redeemedBusiness!.reference.update({
                          ...mapToFirestore(
                            {
                              'business_agefour_redemptions':
                                  FieldValue.increment(1),
                            },
                          ),
                        });
                      } else if ((valueOrDefault(
                                  currentUserDocument?.userAge, 0) >=
                              35) &&
                          (valueOrDefault(currentUserDocument?.userAge, 0) <=
                              54)) {
                        await _model.redeemedBusiness!.reference.update({
                          ...mapToFirestore(
                            {
                              'business_agefive_redemptions':
                                  FieldValue.increment(1),
                            },
                          ),
                        });
                      } else if (valueOrDefault(
                              currentUserDocument?.userAge, 0) >=
                          55) {
                        await _model.redeemedBusiness!.reference.update({
                          ...mapToFirestore(
                            {
                              'business_agesix_redemptions':
                                  FieldValue.increment(1),
                            },
                          ),
                        });
                      }

                      Navigator.pop(context);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 550.0,
                              child: DealProcessedWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      if ((valueOrDefault(
                                      currentUserDocument?.userZipcode, '') !=
                                  null &&
                              valueOrDefault(
                                      currentUserDocument?.userZipcode, '') !=
                                  '') &&
                          (valueOrDefault(currentUserDocument?.userAge, 0) !=
                              null)) {
                        await ZipcodesRecord.createDoc(
                                _model.redeemedBusiness!.reference)
                            .set(createZipcodesRecordData(
                          businessRef: _model.redeemedBusiness?.reference,
                          zipcode: valueOrDefault(
                              currentUserDocument?.userZipcode, ''),
                          redemptionsThere: 1,
                        ));
                        if (valueOrDefault(currentUserDocument?.userAge, 0) <=
                            12) {
                          await _model.redeemedBusiness!.reference.update({
                            ...mapToFirestore(
                              {
                                'business_ageone_redemptions':
                                    FieldValue.increment(1),
                              },
                            ),
                          });
                        } else if ((valueOrDefault(
                                    currentUserDocument?.userAge, 0) >=
                                13) &&
                            (valueOrDefault(currentUserDocument?.userAge, 0) <=
                                17)) {
                          await _model.redeemedBusiness!.reference.update({
                            ...mapToFirestore(
                              {
                                'business_agetwo_redemptions':
                                    FieldValue.increment(1),
                              },
                            ),
                          });
                        } else if ((valueOrDefault(
                                    currentUserDocument?.userAge, 0) >=
                                18) &&
                            (valueOrDefault(currentUserDocument?.userAge, 0) <=
                                24)) {
                          await _model.redeemedBusiness!.reference.update({
                            ...mapToFirestore(
                              {
                                'business_agethree_redemptions':
                                    FieldValue.increment(1),
                              },
                            ),
                          });
                        } else if ((valueOrDefault(
                                    currentUserDocument?.userAge, 0) >=
                                25) &&
                            (valueOrDefault(currentUserDocument?.userAge, 0) <=
                                34)) {
                          await _model.redeemedBusiness!.reference.update({
                            ...mapToFirestore(
                              {
                                'business_agefour_redemptions':
                                    FieldValue.increment(1),
                              },
                            ),
                          });
                        } else if ((valueOrDefault(
                                    currentUserDocument?.userAge, 0) >=
                                35) &&
                            (valueOrDefault(currentUserDocument?.userAge, 0) <=
                                54)) {
                          await _model.redeemedBusiness!.reference.update({
                            ...mapToFirestore(
                              {
                                'business_agefive_redemptions':
                                    FieldValue.increment(1),
                              },
                            ),
                          });
                        } else if (valueOrDefault(
                                currentUserDocument?.userAge, 0) >=
                            55) {
                          await _model.redeemedBusiness!.reference.update({
                            ...mapToFirestore(
                              {
                                'business_agesix_redemptions':
                                    FieldValue.increment(1),
                              },
                            ),
                          });
                        }

                        Navigator.pop(context);
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 550.0,
                                child: DealProcessedWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      } else {
                        Navigator.pop(context);
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 550.0,
                                child: DealProcessedWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      }
                    }

                    setState(() {});
                  },
                  text: 'Store Member Authorize Deal Here',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 45.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Warning!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text:
                            ' The authorization cannot be reversed. Make sure that ',
                        style: GoogleFonts.getFont(
                          'Outfit',
                        ),
                      ),
                      TextSpan(
                        text: 'ONLY',
                        style: GoogleFonts.getFont(
                          'Outfit',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' the store member clicks this button!',
                        style: GoogleFonts.getFont(
                          'Outfit',
                        ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
