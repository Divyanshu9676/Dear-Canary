import 'package:dear_canary/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dear_canary/models/user_details.dart';
import 'package:dear_canary/screens/UserDetailsEntry/user_remaining_data_entry.dart';


class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  //Remark Logic
  String get resultPhrase {
    String resultText;
    if(resultScore>=5 && resultScore<8){
      resultText = "Medium";
    } else if(resultScore >=8) {
      resultText = "Severe";
    } else if(resultScore>2 && resultScore<=5) {
      resultText = "Mild";
    } else{
      resultText = "No";
    }
    return resultText;
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

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10,),

            // Stage of depression printed
            Text(
              resultPhrase,
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Bebas Neue",
                  color: Color(0xff2894ff)
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10,),

            const Text(
              'Pospartum Depression',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const Text(
              'detected',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),//

            const SizedBox(height: 50,),

            // Button direct to homepage
            InkWell(
              onTap: (){

                // to declare that user has taken the test
                UserDetail.initialTestTaken(
                  true,
                  resultScore
                );

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage())
                );
              },
              child: const FaIcon(
                  FontAwesomeIcons.arrowCircleRight,
                  size: 50,
                )

            ) //FlatButton
          ], //<Widget>[]
        ),
      ),
    ); //Center
  }
}