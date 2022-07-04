import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  var value;
  Profile({Key? key, @required this.value}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState(value);
}

class _ProfileState extends State<Profile> {
  _ProfileState(this.mobile);
  late String mobile;

  final whiteWeekDayImageAddress = [
    "assets/images/mon_white.png",
    "assets/images/tue_white.png",
    "assets/images/wed_white.png",
    "assets/images/thu_white.png",
    "assets/images/fri_white.png",
    "assets/images/sat_white.png",
    "assets/images/sun_white.png"
  ];

  final greenWeekDayImageAddress = [
    "assets/images/mon_green.png",
    "assets/images/tue_green.png",
    "assets/images/wed_green.png",
    "assets/images/thu_green.png",
    "assets/images/fri_green.png",
    "assets/images/sat_green.png",
    "assets/images/sun_green.png"
  ];

  final orangeWeekDayImageAddress = [
    "assets/images/mon_orange.png",
    "assets/images/tue_orange.png",
    "assets/images/wed_orange.png",
    "assets/images/thu_orange.png",
    "assets/images/fri_orange.png",
    "assets/images/sat_orange.png",
    "assets/images/sun_orange.png"
  ];

  final emptyWeekDayImageAddress = [
    "assets/images/mon.png",
    "assets/images/tue.png",
    "assets/images/wed.png",
    "assets/images/thu.png",
    "assets/images/fri.png",
    "assets/images/sat.png",
    "assets/images/sun.png"
  ];





  List weekDayStatus  = <Map<String, String>>[
    {
      "day" : "monday",
      "total task done" : "3",
      "test taken" : "1"
    },
    {
      "day" : "tuesday",
      "total task done" : "2",
      "test taken" : "1"
    },
    {
      "day" : "wednesday",
      "total task done" : "1",
      "test taken" : "1"
    },
    {
      "day" : "thursday",
      "total task done" : "0",
      "test taken" : "1"
    },
    {
      "day" : "friday",
      "total task done" : "3",
      "test taken" : "0"
    },
    {
      "day" : "saturday",
      "total task done" : "2",
      "test taken" : "0"
    },
    {
      "day" : "sunday",
      "total task done" : "1",
      "test taken" : "0"
    },
  ];
  
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

  List user = [];
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
        user = result;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xfffff0e1),
          statusBarIconBrightness: Brightness.dark,
        )
    );

    // Alert Dialog
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(

            backgroundColor: const Color(0xfffff0e1),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                        "assets/images/fri_white.png",
                      height: mediaQueryHeight * 0.05,
                    ),
                    SizedBox(width: mediaQueryWidth * 0.02,),
                    const Text(
                      "Not done any task/test",
                      style: TextStyle(
                        fontFamily: "Poppins"
                      ),
                    )
                  ],
                ),
                SizedBox(height: mediaQueryHeight * 0.02,),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/fri_orange.png",
                      height: mediaQueryHeight * 0.05,
                    ),
                    SizedBox(width: mediaQueryWidth * 0.02,),
                    const Text(
                      "Missing any task/test",
                      style: TextStyle(
                          fontFamily: "Poppins"
                      ),
                    )
                  ],
                ),
                SizedBox(height: mediaQueryHeight * 0.02,),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/fri_green.png",
                      height: mediaQueryHeight * 0.05,
                    ),
                    SizedBox(width: mediaQueryWidth * 0.02,),
                    const Text(
                      "Completed all task/test",
                      style: TextStyle(
                          fontFamily: "Poppins"
                      ),
                    )
                  ],
                ),
                SizedBox(height: mediaQueryHeight * 0.02,),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/fri.png",
                      height: mediaQueryHeight * 0.05,
                    ),
                    SizedBox(width: mediaQueryWidth * 0.02,),
                    const Text(
                      "Day yet to come",
                      style: TextStyle(
                          fontFamily: "Poppins"
                      ),
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xfffff0e1),
      resizeToAvoidBottomInset: false,

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

            // Pink box
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: mediaQueryHeight * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                  )
                ),
              ),
            ),

            // Profile Pic
            Positioned(
              top: mediaQueryHeight * 0.08,
              left: mediaQueryWidth * 0.08,
              child: CircleAvatar(
                radius: mediaQueryHeight * 0.1,
                backgroundImage: const AssetImage(
                  "assets/images/black_woman.jpg"
                ),
              )
            ),

            // woman sitting png
            Positioned(
              top: mediaQueryHeight * 0.07,
              right: mediaQueryWidth * 0.035,
              child: Image.asset(
                "assets/images/woman_sitting.png",
                height: mediaQueryHeight * 0.21,
              ),
            ),

            Positioned(
              top: mediaQueryHeight * 0.3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryWidth * 0.05
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    SizedBox(height: mediaQueryHeight*0.01,),

                    // User's Name
                    Text(
                      (user.isNotEmpty ? user[0]['Name'] : ''),
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),
                    ),

                    SizedBox(height: mediaQueryHeight*0.01,),

                    // Age
                    RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: "DOB: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(
                                text: (user.isNotEmpty ? user[0]["DOB"] : ''),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 20
                                )
                            ),
                          ]
                        ),
                      ),

                    // Location
                    RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                                text: "Location: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            TextSpan(
                                text: (user.isNotEmpty ? user[0]['State']+", "+ user[0]['Country'] : ''),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 20
                                )
                            ),
                          ]
                      ),
                    ),

                    SizedBox(
                      height: mediaQueryHeight * 0.1,
                    ),

                    // "Your Progress" text
                    Container(
                      width: mediaQueryWidth * 0.9,
                      height: mediaQueryHeight * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                              "Your Progress:  ",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Bebas Neue",
                                  color: Colors.white
                              ),
                          ),
                          Text(
                            (user.isNotEmpty ? ((user[0]['Task Done'].length)*33.33).toString()+"%" : ''),
                            style: const TextStyle(
                                fontSize: 25,
                                fontFamily: "Bebas Neue",
                                color: Colors.white
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                _showMyDialog();
                              },
                              icon: Icon(
                                Icons.info_outlined,
                                color: Colors.white,
                                size: mediaQueryHeight * 0.04,
                              )
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: mediaQueryHeight * 0.03,
                    ),
                    
                    Container(
                        height: mediaQueryHeight * 0.25,
                        width: mediaQueryWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xfffff0e1),
                          ),
                          color: const Color(0xfffff0e1).withOpacity(0.5)
                        ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mediaQueryWidth * 0.07,
                          vertical: mediaQueryHeight * 0.01
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: mediaQueryWidth * 0.07,
                              mainAxisSpacing: mediaQueryWidth * 0.07
                          ),
                          itemCount: weekDayStatus.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(
                              (weekDayStatus[index]["selected"].toString() == "1")
                                ? (weekDayStatus[index]["total task done"] ==
                                        "3")
                                    ? greenWeekDayImageAddress[index]
                                    : orangeWeekDayImageAddress[index]
                                : (weekDayStatus[index]["total task done"] ==
                                        "0")
                                    ? whiteWeekDayImageAddress[index]
                                    : orangeWeekDayImageAddress[index],
                            );
                          },
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
