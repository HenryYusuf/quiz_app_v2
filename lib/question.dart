import 'package:flutter/material.dart';
import 'package:flutter01/main.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          // color: b,
          color: isSwitched ? Colors.white : Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
