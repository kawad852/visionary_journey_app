import 'package:flutter/material.dart';

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
      body: SizedBox(),
    );
  }
}

// HomeCard()
// OrderLoading()
// OrderWatingDriverHorizontal()
// OrderWatingDriverVertical()
