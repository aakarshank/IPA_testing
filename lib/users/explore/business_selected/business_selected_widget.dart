import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'business_selected_model.dart';
export 'business_selected_model.dart';

class BusinessSelectedWidget extends StatefulWidget {
  const BusinessSelectedWidget({
    super.key,
    required this.businessChosen,
  });

  final ExploreMapRecord? businessChosen;

  @override
  State<BusinessSelectedWidget> createState() => _BusinessSelectedWidgetState();
}

class _BusinessSelectedWidgetState extends State<BusinessSelectedWidget> {
  late BusinessSelectedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessSelectedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: 300.0,
        height: 120.0,
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
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget!.businessChosen!.businessPhoto,
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.businessChosen?.businessName,
                      'businessName',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${widget!.businessChosen?.businessCity}, ${widget!.businessChosen?.businessState}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: ToggleIcon(
                onPressed: () async {
                  setState(
                    () => FFAppState()
                            .favoriteBusinesses
                            .contains(widget!.businessChosen?.businessName)
                        ? FFAppState().removeFromFavoriteBusinesses(
                            widget!.businessChosen!.businessName)
                        : FFAppState().addToFavoriteBusinesses(
                            widget!.businessChosen!.businessName),
                  );
                },
                value: FFAppState()
                    .favoriteBusinesses
                    .contains(widget!.businessChosen?.businessName),
                onIcon: Icon(
                  Icons.favorite_sharp,
                  color: Color(0xFFF01E2C),
                  size: 25.0,
                ),
                offIcon: Icon(
                  Icons.favorite_border_sharp,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
