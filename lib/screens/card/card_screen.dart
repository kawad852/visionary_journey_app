import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/home_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: HomeCard(
        onBook: () {},
        children: [],
      ),
    );
  }
}

// HomeCard()
// OrderLoading()
// OrderWatingDriverHorizontal()
// OrderWatingDriverVertical()
