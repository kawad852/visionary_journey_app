import 'package:flutter/material.dart';
import 'package:visionary_journey_app/controllers/phone_controller.dart';
import 'package:visionary_journey_app/screens/login/widgets/login_side.dart';

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
              child: LoginSide(controller: phoneController),
            ),
          ],
        ),
      ),
    );
  }
}
