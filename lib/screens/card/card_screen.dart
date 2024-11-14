import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/review_card.dart';

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
      body: ReviewCard(),
    );
  }
}

// HomeCard()
// OrderLoading()
// OrderWatingDriverHorizontal()
// OrderWatingDriverVertical()
