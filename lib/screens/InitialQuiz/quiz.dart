import 'package:flutter/material.dart';

import 'package:dear_canary/screens/InitialQuiz/answer.dart';
import 'package:dear_canary/screens/InitialQuiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15
          ),
          child: Question(
            questions[questionIndex]['question'] as String,
          ),
        ),

        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    ); //Column
  }
}