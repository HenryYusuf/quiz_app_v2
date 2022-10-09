import 'package:flutter/material.dart';
import 'package:flutter01/answer.dart';
import 'package:flutter01/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            questionText: question[questionIndex]["questionText"].toString()),
        ...(question[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              answerText: answer['text'] as String,
              selectHandler: (() => answerQuestion(answer['score'] as int)));
        }).toList(),
      ],
    );
  }
}
