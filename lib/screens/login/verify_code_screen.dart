import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:visionary_journey_app/alerts/feedback/app_feedback.dart';
import 'package:visionary_journey_app/screens/login/widgets/login_normal.dart';
import 'package:visionary_journey_app/screens/login/widgets/login_side.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

import '../../models/otp_model.dart';
import '../../network/api_service.dart';
import '../../utils/app_constants.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String countryCode;
  final String phoneNum;

  const VerifyCodeScreen({
    super.key,
    required this.countryCode,
    required this.phoneNum,
  });

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  String? _otp;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_otp == null || _otp!.length < 6) {
      Fluttertoast.showToast(msg: context.appLocalization.enterOtp);
      return;
    }
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _verify(context);
    }
  }

  Future<void> _verify(BuildContext context) async {
    ApiService.fetch(
      context,
      callBack: () async {
        late http.Response response;
        if (kDebugMode) {
          await Future.delayed(const Duration(seconds: 1));
          response = http.Response(jsonEncode(OtpModel().toJson()), 200);
        } else {
          response = await http.post(
            Uri.parse('https://api.doverifyit.com/api/otp-check/$kOtpId'),
            headers: {
              'Content-Type': 'application/json',
              "Authorization": kOtpToken,
            },
            body: jsonEncode({
              "otp": "$_otp",
            }),
          );
        }
        final body = OtpModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        if (response.statusCode == 200 && context.mounted) {
          context.userProvider.login(
            context,
            code: widget.countryCode,
            phoneNum: widget.phoneNum,
          );
        } else if (context.mounted) {
          context.showSnackBar(body.message ?? context.appLocalization.generalError);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBDBDBD),
              Color(0xFFFBFBFB),
            ],
            begin: Alignment(0, 0),
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: MySharedPreferences.appDirction == AppDirction.normal
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LoginNormal(
                          controller: null,
                          onChanged: (value) {
                            _otp = value;
                          },
                          onSubmit: () {
                            _submit();
                          },
                        ),
                      )
                    : LoginSide(
                        controller: null,
                        onChanged: (value) {
                          _otp = value;
                        },
                        onSubmit: () {
                          _submit();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
