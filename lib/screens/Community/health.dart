import 'package:dear_canary/screens/ConfidenceBooster/confidence_booster.dart';
import 'package:flutter/material.dart';

class CommunityHealth extends StatefulWidget {
  const CommunityHealth({Key? key}) : super(key: key);

  @override
  State<CommunityHealth> createState() => _CommunityHealthState();
}

class _CommunityHealthState extends State<CommunityHealth> {
  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery
        .of(context)
        .size
        .height;
    final mediaQueryWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/gif/girl_28.gif"
            ),
          ),

          Container(
            height: mediaQueryHeight * 0.95,
            child: Center(child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: const <Widget>[
                          Text("26/7/2022"),
                          Text("Monday")
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
          )
    ]);


  }
}
