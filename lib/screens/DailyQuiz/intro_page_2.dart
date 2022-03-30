import 'package:dear_canary/screens/DailyQuiz/daily_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dear_canary/screens/InitialQuiz/initial_questioning.dart';

class IntroToDailyQuiz extends StatefulWidget {
  var mobile;
  IntroToDailyQuiz({Key? key,@required this.mobile}) : super(key: key);

  @override
  State<IntroToDailyQuiz> createState() => _IntroToDailyQuizState(mobile);
}

class _IntroToDailyQuizState extends State<IntroToDailyQuiz> {
  _IntroToDailyQuizState(this.mobile);
  late String mobile;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,
          //set brightness for icons, like dark background light icons
        )
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Ready for quick test?\nLet's do it... ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                print(mobile);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyQuestions(value: mobile))
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
