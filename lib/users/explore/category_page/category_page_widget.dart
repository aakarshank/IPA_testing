import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/customer_nav_bar/customer_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_page_model.dart';
export 'category_page_model.dart';

class CategoryPageWidget extends StatefulWidget {
  const CategoryPageWidget({
    super.key,
    required this.categoryTitle,
    required this.categoryImage,
  });

  final String? categoryTitle;
  final String? categoryImage;

  @override
  State<CategoryPageWidget> createState() => _CategoryPageWidgetState();
}

class _CategoryPageWidgetState extends State<CategoryPageWidget> {
  late CategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<DealsRecord>>(
      stream: _model.categoryDeals(
        uniqueQueryKey: valueOrDefault<String>(
          widget!.categoryTitle,
          'categoryTitle',
        ),
        requestFn: () => queryDealsRecord(
          queryBuilder: (dealsRecord) => dealsRecord
              .where(
                'deal_tier',
                isEqualTo: 'All',
              )
              .where(
                'category',
                isEqualTo: widget!.categoryTitle,
              ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DealsRecord> categoryPageDealsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: Text(
                        'Redemly',
                        style: GoogleFonts.getFont(
                          'Outfit',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 33.0,
                        ),
                      ),
                    ),
                  ),
                  centerTitle: false,
                  expandedTitleScale: 1.0,
                ),
                elevation: 0.0,
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: Builder(
                    builder: (context) {
                      final categoryDeals = categoryPageDealsRecordList
                          .where((e) => functions.isDealRedeemable(
                              e.endMoment!,
                              e.availableRedemptions,
                              e.redeemedBy.toList(),
                              currentUserReference!))
                          .toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: categoryDeals.length,
                        itemBuilder: (context, categoryDealsIndex) {
                          final categoryDealsItem =
                              categoryDeals[categoryDealsIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CATEGORY_Container_sl2z9f6y_ON_TAP');
                                if (functions.dealClickedOn(
                                        FFAppState().dealClicksList.toList(),
                                        categoryDealsItem.reference) ==
                                    true) {
                                  context.pushNamed(
                                    'DealSelected',
                                    queryParameters: {
                                      'selectedDeal': serializeParam(
                                        categoryDealsItem,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'selectedDeal': categoryDealsItem,
                                    },
                                  );
                                } else {
                                  await categoryDealsItem.businessRef!.update({
                                    ...mapToFirestore(
                                      {
                                        'business_num_clicks':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });

                                  await categoryDealsItem.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'num_clicks': FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  FFAppState().addToDealClicksList(
                                      categoryDealsItem.reference);
                                  setState(() {});

                                  context.pushNamed(
                                    'DealSelected',
                                    queryParameters: {
                                      'selectedDeal': serializeParam(
                                        categoryDealsItem,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'selectedDeal': categoryDealsItem,
                                    },
                                  );
                                }
                              },
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 375.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 365.0,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.network(
                                                categoryDealsItem.image,
                                                width: double.infinity,
                                                height: 145.0,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                setState(
                                                  () => FFAppState()
                                                          .favoriteDeals
                                                          .contains(
                                                              categoryDealsItem
                                                                  .dealId)
                                                      ? FFAppState()
                                                          .removeFromFavoriteDeals(
                                                              categoryDealsItem
                                                                  .dealId)
                                                      : FFAppState()
                                                          .addToFavoriteDeals(
                                                              categoryDealsItem
                                                                  .dealId),
                                                );
                                              },
                                              value: FFAppState()
                                                  .favoriteDeals
                                                  .contains(
                                                      categoryDealsItem.dealId),
                                              onIcon: Icon(
                                                Icons.favorite_sharp,
                                                color: Color(0xFFF01E2C),
                                                size: 25.0,
                                              ),
                                              offIcon: Icon(
                                                Icons.favorite_border_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Opacity(
                                                opacity: 0.9,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      height: 20.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 200.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF9DF9D1),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  5.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          categoryDealsItem
                                                              .recurrence,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .black,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      height: 20.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 200.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF9DF9D1),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  5.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          categoryDealsItem
                                                              .dealHours,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .black,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          categoryDealsItem.title,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          categoryDealsItem.businessName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.customerNavBarModel,
                    updateCallback: () => setState(() {}),
                    child: CustomerNavBarWidget(
                      pageName: 'Category',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
