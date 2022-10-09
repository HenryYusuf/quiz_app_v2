import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback selectHandler;

  const Answer({
    super.key,
    required this.answerText,
    required this.selectHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
