import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dear_canary/screens/InitialQuiz/quiz.dart';
import 'package:dear_canary/screens/InitialQuiz/result.dart';

class InitialQuestions extends StatefulWidget {
  const InitialQuestions({Key? key}) : super(key: key);

  @override
  _InitialQuestionsState createState() => _InitialQuestionsState();
}

class _InitialQuestionsState extends State<InitialQuestions> {

  final _initialQuestions = [
    {
      'question': 'How often do you laugh and see the funny sides of things?',
      'answers': [
        {'text': 'As often as I usually do', 'score': 0},
        {'text': 'Not so much now', 'score': 1},
        {'text': 'Definitely not so much', 'score': 2},
        {'text': 'Not at all', 'score': 3},
      ]
    },
    {
      'question': 'Have you been anxious and worried about trivial things?',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'Hardly ever', 'score': 1},
        {'text': 'Maybe sometimes', 'score': 2},
        {'text': 'Always', 'score': 3},
      ]
    },
    {
      'question': 'Do you have difficulty sleeping even in a quiet atmosphere?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Not very often', 'score': 1},
        {'text': 'Yes, sometimes', 'score': 2},
        {'text': 'Always', 'score': 3},
      ]
    },
    {
      'question': 'Have you isolated yourself from your family and friends?',
      'answers': [
        {'text': 'No, not at all', 'score': 0},
        {'text': 'I try but sometimes I’m not able to socialize', 'score': 1},
        {'text': 'Occasionally', 'score': 2},
        {'text': 'Quite often', 'score': 3},
      ]
    },
    {
      'question': 'Do you feel angry for no apparent reason?',
      'answers': [
        {'text': 'No, not at all', 'score': 0},
        {'text': 'Rarely', 'score': 1},
        {'text': 'Sometimes', 'score': 2},
        {'text': 'Frequently', 'score': 3},
      ]
    },
    {
      'question': 'Do you have a feeling that you are a bad mother?',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'Sometimes', 'score': 1},
        {'text': 'Quite often', 'score': 2},
        {'text': 'Always', 'score': 3},
      ]
    },
    {
      'question': 'How often do you cry or feel extremely sad?',
      'answers': [
        {'text': 'Rarely', 'score': 0},
        {'text': 'Sometimes when situations are extreme', 'score': 1},
        {'text': 'Often', 'score': 2},
        {'text': 'Daily', 'score': 3},
      ]
    },
    {
      'question': 'Do you blame yourself for no reason?',
      'answers': [
        {'text': 'I have no reason to blame myself', 'score': 0},
        {'text': 'Hardly ever', 'score': 1},
        {'text': 'For something and situations', 'score': 2},
        {'text': 'For everything', 'score': 3},
      ]
    },
    {
      'question': 'How often do you sit with your family and have a conversation?',
      'answers': [
        {'text': 'As often as I used to', 'score': 0},
        {'text': 'Not as much but sometimes', 'score': 1},
        {'text': 'Occasionally', 'score': 2},
        {'text': 'Not at all', 'score': 3},
      ]
    },
    {
      'question': 'Are you having thoughts of hurting yourself?',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'I had it once', 'score': 1},
        {'text': 'Sometimes', 'score': 2},
        {'text': 'All the time', 'score': 3},
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
          statusBarColor: Colors.transparent,
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,
          //set brightness for icons, like dark background light icons
        )
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xfff5eae4),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/gif/girl_29.gif",
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
                  : Result(_totalScore, _resetQuiz),
            ),
          ],
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    );
  }
}
