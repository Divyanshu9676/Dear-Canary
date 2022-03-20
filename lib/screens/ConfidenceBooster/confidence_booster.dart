import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfidenceBooster extends StatefulWidget {
  const ConfidenceBooster({Key? key}) : super(key: key);

  @override
  _ConfidenceBoosterState createState() => _ConfidenceBoosterState();
}

class _ConfidenceBoosterState extends State<ConfidenceBooster> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,
          //set brightness for icons, like dark background light icons
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Confidence Section",
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
              "Will be launched soon..."
          ),
        ),
      ),
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
    );
  }
}
