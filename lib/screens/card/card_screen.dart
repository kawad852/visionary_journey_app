import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/home_card.dart';
import 'package:visionary_journey_app/utils/enums.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: HomeCard(appDirction: AppDirction.right),
    );
  }
}
