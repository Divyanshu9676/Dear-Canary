import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dear_canary/screens/InitialQuiz/initial_questioning.dart';

class IntroToInitialQuiz extends StatelessWidget {
  const IntroToInitialQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Let's take a Quick test...",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InitialQuestions())
                );
              },
              child: const FaIcon(
                FontAwesomeIcons.arrowCircleRight,
                size: 50,
              )
            )
          ],
        ),
      )
    );
  }
}
