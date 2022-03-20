import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {

  final listOfReleivers = [
      {
        "name": "Postpartum Support International",
        "state": "",
        "contactNo": "18009444773",
        "type": "NGO",
        "country": "WorldWide"
      },
      {
        "name": "Beyond Blue Support Service",
        "state": "Victoria",
        "contactNo": "1300224636",
        "type": "NGO",
        "country": "Australia"
      },
      {
      "name": "Michael",
      "state": "Queensland",
      "contactNo": "1217667671",
      "type": "Psychiatrist",
      "country": "Australia"
      },
      {
        "name": "PND",
        "state": "Northland",
        "contactNo": "412-401-6001",
        "type": "NGO",
        "country": "New Zealand"
      },
      {
        "name": "Mothers Matter",
        "state": "Auckland",
        "contactNo": "512-213-1122",
        "type": "NGO",
        "country": "New Zealand"
      },
      {
        "name": "Postpartum Support Virginia",
        "country": "Virginia",
        "contactNo": "(703) 829-7152",
        "type": "NGO"
      },
      {
        "name": "Perinatal Support Washington",
        "country": "Washington",
        "contactNo": "1-888-404-7763",
        "type": "NGO"
      }
  ];

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,
          //set brightness for icons, like dark background light icons
        )
    );

    return Scaffold(
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
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/gif/girl_31.gif",
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 5,
                                color: const Color(0xffff724b)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/doctor.png",
                                    height: MediaQuery.of(context).size.height * 0.175,
                                  ),
                                  const Text(
                                    "Dr. Kenrik Morph",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              const VerticalDivider(
                                color: Color(0xffff724b),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "Every Thursday",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic
                                    ),
                                  ),
                                  const Text(
                                    "at",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      // fontStyle: FontStyle.italic
                                    ),
                                  ),
                                  const Text(
                                    "8:00 PM IST",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "on",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      const url = 'https://meet.google.com/otq-anwb-zfm';
                                      if(await canLaunch(url)){
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xffff724b),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5
                                      ),
                                      child: Image.asset(
                                        "assets/images/meet.png",
                                        height: 40,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          itemCount: listOfReleivers.length,
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  border: Border.all(
                                      width: 5,
                                      color: Colors.grey
                                  )
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      listOfReleivers[index]["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Bebas Neue",
                                        fontSize: 22,
                                        letterSpacing: 1
                                      ),
                                    ),
                                    const SizedBox(height: 2,),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: "Country: ",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Color(0xffff724b),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                            )
                                          ),
                                          TextSpan(
                                            text: listOfReleivers[index]["country"],
                                              style: const TextStyle(
                                                  fontFamily: "Poppins",
                                                  color: Colors.black,
                                                  fontSize: 16
                                              )
                                          )
                                        ]
                                      )
                                    ),
                                    const SizedBox(height: 2,),
                                    RichText(
                                        text: TextSpan(
                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: "State: ",
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Color(0xffff724b),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                  )
                                              ),
                                              TextSpan(
                                                  text: listOfReleivers[index]["state"],
                                                  style: const TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Colors.black,
                                                      fontSize: 16
                                                  )
                                              )
                                            ]
                                        )
                                    ),
                                    const SizedBox(height: 2,),
                                    RichText(
                                        text: TextSpan(
                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: "Type: ",
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Color(0xffff724b),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                  )
                                              ),
                                              TextSpan(
                                                  text: listOfReleivers[index]["type"],
                                                  style: const TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Colors.black,
                                                      fontSize: 16
                                                  )
                                              )
                                            ]
                                        )
                                    ),
                                    const SizedBox(height: 2,),
                                    RichText(
                                        text: TextSpan(
                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: "Contact No.: ",
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Color(0xffff724b),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                  )
                                              ),
                                              TextSpan(
                                                  text: listOfReleivers[index]["contactNo"],
                                                  style: const TextStyle(
                                                      fontFamily: "Poppins",
                                                      color: Colors.black,
                                                      fontSize: 16
                                                  )
                                              )
                                            ]
                                        )
                                    )
                                  ]
                                )
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
