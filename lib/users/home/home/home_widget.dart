import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bars/customer_nav_bar/customer_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return StreamBuilder<List<DealsRecord>>(
      stream: FFAppState().tierAllDeals(
        requestFn: () => queryDealsRecord(
          queryBuilder: (dealsRecord) => dealsRecord
              .where(
                'deal_tier',
                isEqualTo: 'All',
              )
              .orderBy('num_redemptions', descending: true),
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
        List<DealsRecord> homeDealsRecordList = snapshot.data!;

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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).accent1,
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 5.0),
                            child: Text(
                              'Trending',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 21.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final trendingDealsOnHome = homeDealsRecordList
                                .where((e) => functions.isDealRedeemable(
                                    e.endMoment!,
                                    e.availableRedemptions,
                                    e.redeemedBy.toList(),
                                    currentUserReference!))
                                .toList()
                                .take(10)
                                .toList();
                            if (trendingDealsOnHome.isEmpty) {
                              return Image.asset(
                                'assets/images/Untitled_design_(1).png',
                                width: double.infinity,
                                height: 250.0,
                              );
                            }

                            return Container(
                              width: double.infinity,
                              height: 250.0,
                              child: CarouselSlider.builder(
                                itemCount: trendingDealsOnHome.length,
                                itemBuilder:
                                    (context, trendingDealsOnHomeIndex, _) {
                                  final trendingDealsOnHomeItem =
                                      trendingDealsOnHome[
                                          trendingDealsOnHomeIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Container_e25325jp_ON_TAP');
                                        if (functions.dealClickedOn(
                                                FFAppState()
                                                    .dealClicksList
                                                    .toList(),
                                                trendingDealsOnHomeItem
                                                    .reference) ==
                                            true) {
                                          context.pushNamed(
                                            'DealSelected',
                                            queryParameters: {
                                              'selectedDeal': serializeParam(
                                                trendingDealsOnHomeItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'selectedDeal':
                                                  trendingDealsOnHomeItem,
                                            },
                                          );
                                        } else {
                                          await trendingDealsOnHomeItem
                                              .businessRef!
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'business_num_clicks':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });

                                          await trendingDealsOnHomeItem
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'num_clicks':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });
                                          FFAppState().addToDealClicksList(
                                              trendingDealsOnHomeItem
                                                  .reference);
                                          setState(() {});

                                          context.pushNamed(
                                            'DealSelected',
                                            queryParameters: {
                                              'selectedDeal': serializeParam(
                                                trendingDealsOnHomeItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'selectedDeal':
                                                  trendingDealsOnHomeItem,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 365.0,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        trendingDealsOnHomeItem
                                                            .image,
                                                        width: double.infinity,
                                                        height: 165.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: ToggleIcon(
                                                      onPressed: () async {
                                                        setState(
                                                          () => FFAppState()
                                                                  .favoriteDeals
                                                                  .contains(
                                                                      trendingDealsOnHomeItem
                                                                          .dealId)
                                                              ? FFAppState()
                                                                  .removeFromFavoriteDeals(
                                                                      trendingDealsOnHomeItem
                                                                          .dealId)
                                                              : FFAppState()
                                                                  .addToFavoriteDeals(
                                                                      trendingDealsOnHomeItem
                                                                          .dealId),
                                                        );
                                                      },
                                                      value: FFAppState()
                                                          .favoriteDeals
                                                          .contains(
                                                              trendingDealsOnHomeItem
                                                                  .dealId),
                                                      onIcon: Icon(
                                                        Icons.favorite_sharp,
                                                        color:
                                                            Color(0xFFF01E2C),
                                                        size: 25.0,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons
                                                            .favorite_border_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              height: 20.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 200.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF9DF9D1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  topRight: Radius
                                                                      .circular(
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
                                                                  trendingDealsOnHomeItem
                                                                      .recurrence,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              height: 20.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 200.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF9DF9D1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  topRight: Radius
                                                                      .circular(
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
                                                                  trendingDealsOnHomeItem
                                                                      .dealHours,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        9.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  trendingDealsOnHomeItem.title,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        9.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  trendingDealsOnHomeItem
                                                      .businessName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselController(),
                                options: CarouselOptions(
                                  initialPage: max(0,
                                      min(1, trendingDealsOnHome.length - 1)),
                                  viewportFraction: 1.0,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 500),
                                  autoPlayInterval:
                                      Duration(milliseconds: (500 + 3000)),
                                  autoPlayCurve: Curves.linear,
                                  pauseAutoPlayInFiniteScroll: true,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 375.0,
                          child: Divider(
                            thickness: 0.5,
                            color: Color(0xFFBFC9CE),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 10.0),
                            child: Text(
                              'Nearby',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 21.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Builder(
                            builder: (context) {
                              final nearbyDealsOnHome = homeDealsRecordList
                                  .where((e) =>
                                      (e.checkLocation == true) &&
                                      functions.isDealRedeemable(
                                          e.endMoment!,
                                          e.availableRedemptions,
                                          e.redeemedBy.toList(),
                                          currentUserReference!))
                                  .toList()
                                  .sortedList((e) => functions
                                      .getDistanceFromUser(
                                          e.businessLocations.toList(),
                                          currentUserLocationValue)
                                      .toString())
                                  .toList()
                                  .take(10)
                                  .toList();

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(nearbyDealsOnHome.length,
                                        (nearbyDealsOnHomeIndex) {
                                  final nearbyDealsOnHomeItem =
                                      nearbyDealsOnHome[nearbyDealsOnHomeIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_Container_v6tt1z0e_ON_TAP');
                                          if (functions.dealClickedOn(
                                                  FFAppState()
                                                      .dealClicksList
                                                      .toList(),
                                                  nearbyDealsOnHomeItem
                                                      .reference) ==
                                              true) {
                                            context.pushNamed(
                                              'DealSelected',
                                              queryParameters: {
                                                'selectedDeal': serializeParam(
                                                  nearbyDealsOnHomeItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'selectedDeal':
                                                    nearbyDealsOnHomeItem,
                                              },
                                            );
                                          } else {
                                            await nearbyDealsOnHomeItem
                                                .businessRef!
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'business_num_clicks':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });

                                            await nearbyDealsOnHomeItem
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'num_clicks':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                            FFAppState().addToDealClicksList(
                                                nearbyDealsOnHomeItem
                                                    .reference);
                                            setState(() {});

                                            context.pushNamed(
                                              'DealSelected',
                                              queryParameters: {
                                                'selectedDeal': serializeParam(
                                                  nearbyDealsOnHomeItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'selectedDeal':
                                                    nearbyDealsOnHomeItem,
                                              },
                                            );
                                          }
                                        },
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 280.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 280.0,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        child: Image.network(
                                                          nearbyDealsOnHomeItem
                                                              .image,
                                                          width:
                                                              double.infinity,
                                                          height: 140.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: ToggleIcon(
                                                        onPressed: () async {
                                                          setState(
                                                            () => FFAppState()
                                                                    .favoriteDeals
                                                                    .contains(
                                                                        nearbyDealsOnHomeItem
                                                                            .dealId)
                                                                ? FFAppState()
                                                                    .removeFromFavoriteDeals(
                                                                        nearbyDealsOnHomeItem
                                                                            .dealId)
                                                                : FFAppState()
                                                                    .addToFavoriteDeals(
                                                                        nearbyDealsOnHomeItem
                                                                            .dealId),
                                                          );
                                                        },
                                                        value: FFAppState()
                                                            .favoriteDeals
                                                            .contains(
                                                                nearbyDealsOnHomeItem
                                                                    .dealId),
                                                        onIcon: Icon(
                                                          Icons.favorite_sharp,
                                                          color:
                                                              Color(0xFFF01E2C),
                                                          size: 25.0,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons
                                                              .favorite_border_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 25.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 20.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      150.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    nearbyDealsOnHomeItem
                                                                        .recurrence,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Colors.black,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 20.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      150.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    nearbyDealsOnHomeItem
                                                                        .dealHours,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Colors.black,
                                                                          letterSpacing:
                                                                              0.0,
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
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    nearbyDealsOnHomeItem.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    nearbyDealsOnHomeItem
                                                        .businessName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 375.0,
                          child: Divider(
                            thickness: 0.5,
                            color: Color(0xFFBFC9CE),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 10.0),
                            child: Text(
                              'For You',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 21.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Builder(
                            builder: (context) {
                              final forYouOnHome = homeDealsRecordList
                                  .where((e) =>
                                      functions
                                          .userTopCategories(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userDiningCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userApparelCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userLifestyleCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userElectronicsCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userFitnessCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userPetsCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userHomegardenCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userAutomotiveCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userDessertsCount,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.userEntertainmentCount,
                                                  0))
                                          .contains(e.category) &&
                                      functions.isDealRedeemable(
                                          e.endMoment!,
                                          e.availableRedemptions,
                                          e.redeemedBy.toList(),
                                          currentUserReference!))
                                  .toList()
                                  .take(15)
                                  .toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(forYouOnHome.length,
                                    (forYouOnHomeIndex) {
                                  final forYouOnHomeItem =
                                      forYouOnHome[forYouOnHomeIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_Container_pq5he5z8_ON_TAP');
                                          if (functions.dealClickedOn(
                                                  FFAppState()
                                                      .dealClicksList
                                                      .toList(),
                                                  forYouOnHomeItem.reference) ==
                                              true) {
                                            context.pushNamed(
                                              'DealSelected',
                                              queryParameters: {
                                                'selectedDeal': serializeParam(
                                                  forYouOnHomeItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'selectedDeal':
                                                    forYouOnHomeItem,
                                              },
                                            );
                                          } else {
                                            await forYouOnHomeItem.businessRef!
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'business_num_clicks':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });

                                            await forYouOnHomeItem.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'num_clicks':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                            FFAppState().addToDealClicksList(
                                                forYouOnHomeItem.reference);
                                            setState(() {});

                                            context.pushNamed(
                                              'DealSelected',
                                              queryParameters: {
                                                'selectedDeal': serializeParam(
                                                  forYouOnHomeItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'selectedDeal':
                                                    forYouOnHomeItem,
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        child: Image.network(
                                                          forYouOnHomeItem
                                                              .image,
                                                          width:
                                                              double.infinity,
                                                          height: 145.0,
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: ToggleIcon(
                                                        onPressed: () async {
                                                          setState(
                                                            () => FFAppState()
                                                                    .favoriteDeals
                                                                    .contains(
                                                                        forYouOnHomeItem
                                                                            .dealId)
                                                                ? FFAppState()
                                                                    .removeFromFavoriteDeals(
                                                                        forYouOnHomeItem
                                                                            .dealId)
                                                                : FFAppState()
                                                                    .addToFavoriteDeals(
                                                                        forYouOnHomeItem
                                                                            .dealId),
                                                          );
                                                        },
                                                        value: FFAppState()
                                                            .favoriteDeals
                                                            .contains(
                                                                forYouOnHomeItem
                                                                    .dealId),
                                                        onIcon: Icon(
                                                          Icons.favorite_sharp,
                                                          color:
                                                              Color(0xFFF01E2C),
                                                          size: 25.0,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons
                                                              .favorite_border_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 25.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 20.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      200.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF9DF9D1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    forYouOnHomeItem
                                                                        .recurrence,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Colors.black,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 20.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      200.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF9DF9D1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    forYouOnHomeItem
                                                                        .dealHours,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Colors.black,
                                                                          letterSpacing:
                                                                              0.0,
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
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          9.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    forYouOnHomeItem.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          9.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    forYouOnHomeItem
                                                        .businessName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.customerNavBarModel,
                    updateCallback: () => setState(() {}),
                    child: CustomerNavBarWidget(
                      pageName: 'Home',
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
