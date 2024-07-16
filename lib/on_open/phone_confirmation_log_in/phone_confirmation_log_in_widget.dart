import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_confirmation_log_in_model.dart';
export 'phone_confirmation_log_in_model.dart';

class PhoneConfirmationLogInWidget extends StatefulWidget {
  const PhoneConfirmationLogInWidget({
    super.key,
    required this.userPhone,
  });

  final String? userPhone;

  @override
  State<PhoneConfirmationLogInWidget> createState() =>
      _PhoneConfirmationLogInWidgetState();
}

class _PhoneConfirmationLogInWidgetState
    extends State<PhoneConfirmationLogInWidget> {
  late PhoneConfirmationLogInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneConfirmationLogInModel());

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).accent1,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
              child: Text(
                'Verify Your Number',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 0.0, 0.0),
              child: Text(
                'Enter the 6-digit code sent to you at',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.userPhone,
                  'phoneNumber',
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PHONE_CONFIRMATION_LOG_IN_Text_1ttr1eyd_');
                  setState(() {
                    _model.pinCodeController?.clear();
                  });

                  context.goNamed('UserLogin');
                },
                child: Text(
                  'Wrong number?',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFFFB868D),
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 12.0),
              child: PinCodeTextField(
                autoDisposeControllers: false,
                appContext: context,
                length: 6,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                enableActiveFill: false,
                autoFocus: true,
                enablePinAutofill: false,
                errorTextSpace: 16.0,
                showCursor: true,
                cursorColor: FlutterFlowTheme.of(context).primary,
                obscureText: false,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  fieldHeight: 44.0,
                  fieldWidth: 44.0,
                  borderWidth: 2.0,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  shape: PinCodeFieldShape.circle,
                  activeColor: FlutterFlowTheme.of(context).primaryText,
                  inactiveColor: FlutterFlowTheme.of(context).alternate,
                  selectedColor: FlutterFlowTheme.of(context).primary,
                  activeFillColor: FlutterFlowTheme.of(context).primaryText,
                  inactiveFillColor: FlutterFlowTheme.of(context).alternate,
                  selectedFillColor: FlutterFlowTheme.of(context).primary,
                ),
                controller: _model.pinCodeController,
                onChanged: (_) {},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    _model.pinCodeControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('PHONE_CONFIRMATION_LOG_IN_VERIFY_BTN_ON_');
                  GoRouter.of(context).prepareAuthEvent(true);
                  final smsCodeVal = _model.pinCodeController!.text;
                  if (smsCodeVal == null || smsCodeVal.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter SMS verification code.'),
                      ),
                    );
                    return;
                  }
                  final phoneVerifiedUser = await authManager.verifySmsCode(
                    context: context,
                    smsCode: smsCodeVal,
                  );
                  if (phoneVerifiedUser == null) {
                    return;
                  }

                  context.goNamedAuth(
                    'ProfilePage',
                    context.mounted,
                    ignoreRedirect: true,
                  );
                },
                text: 'Verify',
                options: FFButtonOptions(
                  width: 280.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.black,
                        fontSize: 19.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'Did not receive the code?',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Outfit',
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('PHONE_CONFIRMATION_LOG_IN_Text_xzqcjwg1_');
                setState(() {
                  _model.pinCodeController?.clear();
                });
                final phoneNumberVal = widget!.userPhone;
                if (phoneNumberVal == null ||
                    phoneNumberVal.isEmpty ||
                    !phoneNumberVal.startsWith('+')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Phone Number is required and has to start with +.'),
                    ),
                  );
                  return;
                }
                await authManager.beginPhoneAuth(
                  context: context,
                  phoneNumber: phoneNumberVal,
                  onCodeSent: (context) async {
                    context.goNamedAuth(
                      'PhoneConfirmationLogIn',
                      context.mounted,
                      queryParameters: {
                        'userPhone': serializeParam(
                          widget!.userPhone,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      ignoreRedirect: true,
                    );
                  },
                );
              },
              child: Text(
                'Send the code again',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
