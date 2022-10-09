import 'package:flutter/material.dart';
import 'package:flutter01/quiz.dart';
import 'package:flutter01/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 = 0, num1 = 0, num2 = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex == 0) {
      num0 = score;
    } else if (_questionIndex == 1) {
      num1 = score;
    } else if (_questionIndex == 2) {
      num2 = score;
    }

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
    print(num0);
    print(num1);
    print(num2);
    print(_totalScore);
  }

  final List<Map<String, Object>> _question = [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", "score": 5},
        {"text": "Lion", "score": 9}
      ],
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answers": [
        {"text": "Hen", "score": 1},
        {"text": "Hen", "score": 1},
        {"text": "Hen", "score": 1},
        {"text": "Hen", "score": 1}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Quiz App',
              style: TextStyle(color: isSwitched ? Colors.white : Colors.black),
            ),
            actions: [
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: Colors.white,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.black,
              )
            ],
          ),
          body: Container(
            color: isSwitched ? Colors.black : Colors.white,
            width: double.infinity,
            child: _questionIndex < _question.length
                ? Quiz(
                    question: _question,
                    questionIndex: _questionIndex,
                    answerQuestion: _answerQuestion,
                  )
                : Result(
                    resetQuiz: _resetQuiz,
                    resultScore: _totalScore,
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_questionIndex == 1) _totalScore -= num0;
              if (_questionIndex == 2) _totalScore -= num1;
              if (_questionIndex == 3) _totalScore -= num2;

              setState(() {
                if (_questionIndex > 0) {
                  _questionIndex--;
                }
              });
            },
            child: Icon(
              Icons.arrow_back,
              color: isSwitched ? Colors.black : Colors.white,
              size: 40,
            ),
          )),
    );
  }
}
