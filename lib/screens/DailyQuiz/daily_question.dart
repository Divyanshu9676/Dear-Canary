import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dear_canary/screens/DailyQuiz/quiz.dart';
import 'package:dear_canary/screens/DailyQuiz/result.dart';

class DailyQuestions extends StatefulWidget {
  var value;
  DailyQuestions({Key? key, @required this.value}) : super(key: key);

  @override
  _DailyQuestionsState createState() => _DailyQuestionsState(value);
}

class _DailyQuestionsState extends State<DailyQuestions> {
  _DailyQuestionsState(this.mobile);
  late String mobile;

  final _initialQuestions = [
    {
      'question': 'Did you find yourself lost on self critical thought?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0 },
      ]
    },
    {
      'question': 'Had a proper sleep?',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 1 },
      ]
    },
    {
      'question': 'Did you bothered yourself by poor appetite or overeating?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0 },
      ]
    },
    {
      'question': 'Was there any pleasure or little interest in doing things?',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 1 },
      ]
    },
    {
      'question': 'Did you feel like you experienced an anxiety attack today?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0 },
      ]
    },
    {
      'question': 'Did you feel bothered by not being able to stop or control worrying? ',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0 },
      ]
    },
    {
      'question': 'Did you felt bothered by feeling afraid as if something awful might happen?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0 },
      ]
    },
    {
      'question': 'Were you able to relax and sit still even for short periods of time?',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 1},
      ]
    },
    {
      'question': 'Were you you able to talk freely to one or more people that yoi could depend on?',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 1},
      ]
    },
    {
      'question': 'Did you feel bothered by becoming easily annoyed or irritable?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0 },
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _initialQuestions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xfff1f2f5),
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,
          //set brightness for icons, like dark background light icons
        )
    );

    return Scaffold(
        backgroundColor: const Color(0xfff1f2f5),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/gif/girl_13.gif",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: _questionIndex < _initialQuestions.length
                  ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _initialQuestions,
              ) //Quiz
                  : Result(_totalScore, _resetQuiz, mobile),
            ),
          ],
        ), //Padding
      );
  }
}
