import 'package:flutter/material.dart';
import 'package:visionary_journey_app/controllers/phone_controller.dart';
import 'package:visionary_journey_app/screens/login/widgets/login_normal.dart';
import 'package:visionary_journey_app/screens/login/widgets/login_side.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late PhoneController phoneController;

  @override
  void initState() {
    super.initState();
    MySharedPreferences.isPassedIntro = true;
    phoneController = PhoneController(context);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: MySharedPreferences.appDirction == AppDirction.normal
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: LoginNormal(controller: phoneController),
                    )
                  : LoginSide(controller: phoneController),
            ),
          ],
        ),
      ),
    );
  }
}
