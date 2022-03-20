import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dear_canary/screens/Diary/new_diary_entry.dart';
import 'package:dear_canary/screens/Diary/old_diary_entry.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xfffefffe),
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,
          //set brightness for icons, like dark background light icons
        )
    );

    return Scaffold(
      backgroundColor: const Color(0xfffefffe),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              // Daily Diary Text
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Center(
                    child: Text(
                      "Daily",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 20
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Diary",
                      style: TextStyle(
                          fontFamily: "Lemon Milk",
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    ),
                  ),
                ],
              ),

              // Image and tagline
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/gif/girl_30.gif",
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  const SizedBox(height: 5,),
                  const Center(
                    child: Text(
                      '"Don\'t store it. Just let it flow like wind."',
                      textAlign: TextAlign.center ,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: "Poppins",
                          fontSize: 13
                      ),
                    ),
                  ),
                ],
              ),

              // New Entry and Old Entry Button
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                  //New Entry
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewDiaryEntry())
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: const EdgeInsets.symmetric(vertical: 6.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.black,
                              width: 5
                          ),
                          color: Colors.black.withOpacity(0.8)
                      ),
                      child: const Text(
                        "New Entry",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Dongle",
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  
                  //Old Entry
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OldDiaryEntry())
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: const EdgeInsets.symmetric(vertical: 6.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.black,
                              width: 5
                          ),
                          color: Colors.black.withOpacity(0.8)
                      ),
                      child: const Text(
                        "Old Entry",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Dongle",
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5,),

            ],
          ),
        )
      ),
    );
  }
}
