import 'package:dear_canary/screens/Community/health_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dear_canary/screens/Community/community.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      //color set to transparent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Community",
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(18),
            //   topRight: Radius.circular(18)
            // ),
            color: Color(0xFF41C9C6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Device button
                InkWell(
                  onTap: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HealthSection()));},
                  child: Image.asset("assets/images/health.png",
                      height: 30, color: const Color(0xFF554E7E)),
                ),

                // Doctor Button
                InkWell(
                  onTap: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Community()));},
                  child: Image.asset(
                    "assets/images/bell.png",
                    height: 30,
                    color: const Color(0xFF554E7E),
                  ),
                ),

                // Setting Button
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/experience.png",
                    height: 30,
                    color: const Color(0xFF554E7E),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const Center(
          child: Text(
              "Will be available soon..."
          ),
        ),);
  }
}
