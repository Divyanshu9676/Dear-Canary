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

  final weekDayStatus = [
    {
      "image address" : "assets/images/mon.png",
      "total task done": 3,
      "test taken": true
    },
    {
      "image address" : "assets/images/tue.png",
      "total task done": 2,
      "test taken": true
    },
    {
      "image address" : "assets/images/wed.png",
      "total task done": 1,
      "test taken": true
    },
    {
      "image address" : "assets/images/thu.png",
      "total task done": 0,
      "test taken": true
    },
    {
      "image address" : "assets/images/fri.png",
      "total task done": 3,
      "test taken": false
    },
    {
      "image address" : "assets/images/sat.png",
      "total task done": 2,
      "test taken": false
    },
    {
      "image address" : "assets/images/sun.png",
      "total task done": 1,
      "test taken": false
    },
  ];
  
  Future getUserList(String docId) async {
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
    dynamic result = await getUserList(mobile);
    if (result == null) {
      print("Error");
    } else {
      setState(() {
        user = result;
        name=user[0]["Name"].toString();
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
              child: Image.asset(
                "assets/images/profile.png",
                height: 150,
              ),
            ),

            // woman sitting png
            Positioned(
              top: mediaQueryHeight * 0.07,
              right: mediaQueryWidth * 0.035,
              child: Image.asset(
                "assets/images/woman_sitting.png",
                height: 150,
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
                    const Text(
                      "Michale Standred",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),
                    ),

                    SizedBox(height: mediaQueryHeight*0.01,),

                    // Age
                    RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Age: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(
                                text: "34",
                                style: TextStyle(
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
                      text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Location: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            TextSpan(
                                text: "Washington, USA",
                                style: TextStyle(
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
                              "Your Progress",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Bebas Neue",
                                  color: Colors.white
                              ),
                          ),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.info_outlined,
                                color: Colors.white,
                                size: mediaQueryHeight * 0.05,
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
                              weekDayStatus[index]["image address"].toString(),
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
