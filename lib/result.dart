import 'package:flutter/material.dart';
import 'package:flutter01/main.dart';

class Result extends StatelessWidget {
  final VoidCallback resetQuiz;
  final int resultScore;

  const Result({super.key, required this.resetQuiz, required this.resultScore});

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score is $resultScore",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              // color: b,
              color: isSwitched ? Colors.white : Colors.black,
            ),
          ),
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              // color: b,
              color: isSwitched ? Colors.white : Colors.black,
            ),
          ),
          TextButton(
            onPressed: resetQuiz,
            child: const Text(
              "Restart The Quiz!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
