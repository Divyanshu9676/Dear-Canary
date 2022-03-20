import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      body: Stack(
        children: <Widget>[
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
            Positioned(
              top: mediaQueryHeight * 0.08,
              left: mediaQueryWidth * 0.08,
              child: Image.asset(
                "assets/images/profile.png",
                height: 150,
              ),
            ),
            Positioned(
              top: mediaQueryHeight * 0.065,
              right: mediaQueryWidth * 0.035,
              child: Image.asset(
                "assets/images/woman_sitting.png",
                height: 150,
              ),
            )
        ],
      ),
    );
  }
}
