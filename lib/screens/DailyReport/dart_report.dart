import 'package:dear_canary/screens/DailyQuiz/intro_page_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DailyReport extends StatefulWidget {
  const DailyReport({Key? key}) : super(key: key);

  @override
  _DailyReportState createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {

  final listOfTasks = [
    {
      "name": "At least 10 min\nMeditation",
      "image address": "assets/images/meditation.png",
      "selected": false
    },
    {
      "name": "2 times\nmeal",
      "image address": "assets/images/food.png",
      "selected": false
    },
    {
      "name": "At least 15 min\nExercise/Yoga",
      "image address": "assets/images/yoga.png",
      "selected": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xffca9dff),
      statusBarIconBrightness: Brightness.light,
    ));

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffca9dff),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/gif/girl_10.gif",
                ),
              ),
              Container(
                height: double.infinity,
                child: Column(
                  children: <Widget>[

                    SizedBox(
                      height: mediaQueryHeight * 0.1,
                    ),

                    // "Daily task" text
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Daily Task",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Bebas Neue",
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),

                    ListView.builder(
                      itemCount: listOfTasks.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card();
                      },
                    ),


                    // "Take a quick test" button
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroToDailyQuiz(mobile: "")));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: const EdgeInsets.symmetric(vertical: 6.5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color(0xff8434f2), width: 5),
                              color: const Color(0xff8434f2).withOpacity(0.5)),
                          child: const Text(
                            "Take a quick test",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Dongle",
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
        ],
      ),
    ));
  }
}
