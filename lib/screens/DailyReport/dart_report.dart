import 'package:dear_canary/screens/DailyQuiz/intro_page_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DailyReport extends StatefulWidget {
  var mobile;
  DailyReport({Key? key, @required this.mobile}) : super(key: key);

  @override
  _DailyReportState createState() => _DailyReportState(mobile);
}

class _DailyReportState extends State<DailyReport> {
  _DailyReportState(this.mobile);
  late String mobile;
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

  List listOfTaskCondition = [false, false, false];

  final taskDone = [];

  Future getUserList() async {
    List itemList = [];
    try {
      await FirebaseFirestore.instance
          .collection('Dear Canary').doc(mobile)
          .get()
          .then((querySnapshot) {
        // for (var element in querySnapshot.get(mobile)) {
        itemList.add(querySnapshot.data());
        // }
      });
      return itemList;
    } catch (e) {
      throw(e.toString());
    }
  }

  String name="";

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await getUserList();
    if (result != null) {
      setState(() {
        listOfTaskCondition= result[0]["List Of Task"];
      });
    }
  }

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
          floatingActionButton: FloatingActionButton(
            child: const FaIcon(
              FontAwesomeIcons.home,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/gif/girl_10.gif",
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: mediaQueryHeight * 0.025,
                    ),

                // "Daily task" text
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Daily Task",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: "Bebas Neue",
                              color: Colors.white),
                        ),
                      ),
                    ),

                // "Daily task" text
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Select if done any...",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ),

                    SizedBox(height: mediaQueryHeight * 0.02),
                    const Divider(color: Colors.white, thickness: 1),
                    SizedBox(height: mediaQueryHeight * 0.025),

                    //Daily task list
                    SizedBox(
                      height: mediaQueryHeight * 0.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listOfTasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(mediaQueryWidth * 0.01),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    listOfTaskCondition[index] =
                                        !listOfTaskCondition[index];
                                  });
                                  if (listOfTaskCondition[index]) {
                                    taskDone
                                        .add(listOfTasks[index]["name"].toString());
                                  } else {
                                    taskDone.removeWhere((element) =>
                                        element == listOfTasks[index]["name"]);
                                  }
                                  FirebaseFirestore.instance
                                      .collection('Dear Canary')
                                      .doc(mobile)
                                      .update({"Task Done": taskDone,"List Of Task": listOfTaskCondition});
                                },
                                child: Container(
                                  margin: EdgeInsets.all(mediaQueryWidth * 0.01),
                                  height: mediaQueryHeight * 0.25,
                                  width: mediaQueryHeight * 0.3,
                                  decoration: BoxDecoration(
                                      color: !listOfTaskCondition[index]
                                          ? Colors.white
                                          : Colors.green,
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        listOfTasks[index]["image address"]
                                            .toString(),
                                        height: mediaQueryHeight * 0.1,
                                      ),
                                      SizedBox(
                                        height: mediaQueryHeight * 0.02,
                                      ),
                                      Text(
                                        listOfTasks[index]["name"].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 15,
                                          color: !listOfTaskCondition[index]
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      )
                                    ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: mediaQueryHeight * 0.02),
                const Divider(color: Colors.white, thickness: 1),
                SizedBox(height: mediaQueryHeight * 0.025),

                // "Take a quick test" button
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  IntroToDailyQuiz(mobile: mobile)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: const EdgeInsets.symmetric(vertical: 6.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: const Color(0xff8434f2), width: 5),
                          color: const Color(0xff8434f2).withOpacity(0.9)),
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
