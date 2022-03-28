import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DailyReport extends StatefulWidget {
  const DailyReport({Key? key}) : super(key: key);

  @override
  _DailyReportState createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xffca9dff),
          statusBarIconBrightness: Brightness.light,
        )
    );

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
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Daily Task"
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
