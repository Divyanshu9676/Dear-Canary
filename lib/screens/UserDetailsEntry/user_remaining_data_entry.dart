import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dear_canary/models/user_details.dart';
import 'package:dear_canary/screens/home.dart';

class RemainingDataEntry extends StatefulWidget {
  const RemainingDataEntry({Key? key}) : super(key: key);

  @override
  _RemainingDataEntryState createState() => _RemainingDataEntryState();
}

class _RemainingDataEntryState extends State<RemainingDataEntry> {

  final _userCountryController = TextEditingController();
  final _userStateController = TextEditingController();
  final _userPinCodeController = TextEditingController();
  final _userJobController = TextEditingController();
  bool _userSingleMother = false;

  // Alert Dialog
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          content: const Text(
            'Details missing...',
            style: TextStyle(
              fontFamily: "Poppins",

            ),
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          // bottomRight: Radius.circular(60)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            // spreadRadius: 5,
                            blurRadius: 7,
                            // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/gif/girl_15.gif",
                      height: 200,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),

                  // Country
                  Container(
                    height: 60,
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _userCountryController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        // fontWeight: FontWeight.bold
                      ),
                      onTap: (){

                      },
                      decoration: InputDecoration(
                          labelText: "Country",
                          labelStyle: const TextStyle(
                              fontFamily: "Bebas Neue",
                              color: Colors.black
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 5
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.yellow,
                                  width: 5
                              )
                          )
                      ),
                    ),
                  ),

                  // State
                  Container(
                    height: 60,
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _userStateController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        // fontWeight: FontWeight.bold
                      ),
                      onTap: (){

                      },
                      decoration: InputDecoration(
                          labelText: "State",
                          labelStyle: const TextStyle(
                              fontFamily: "Bebas Neue",
                              color: Colors.black
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 5
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.yellow,
                                  width: 5
                              )
                          )
                      ),
                    ),
                  ),

                  //PinCode
                  Container(
                    height: 60,
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _userPinCodeController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        // fontWeight: FontWeight.bold
                      ),
                      onTap: (){

                      },
                      decoration: InputDecoration(
                          labelText: "PINCODE",
                          labelStyle: const TextStyle(
                              fontFamily: "Bebas Neue",
                              color: Colors.black
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 5
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.yellow,
                                  width: 5
                              )
                          )
                      ),
                    ),
                  ),

                  // Single Mother
                  Container(
                    height: 60,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.white,
                            width: 5
                        )
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  "Single Mother",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Bebas Neue",
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Switch(
                                value: _userSingleMother,
                                onChanged: (value){
                                  setState(() {
                                    _userSingleMother = value;
                                  });
                                },
                                activeColor: Colors.white,
                              )
                            ]
                        ),
                      ],

                    ),
                  ),

                  //Job
                  Container(
                    height: 60,
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _userJobController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        // fontWeight: FontWeight.bold
                      ),
                      decoration: InputDecoration(
                          labelText: "Job",
                          labelStyle: const TextStyle(
                              fontFamily: "Bebas Neue",
                              color: Colors.black
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 5
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.yellow,
                                  width: 5
                              )
                          )
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //Proceed Button
                  ElevatedButton(
                      onPressed: (){

                        if (_userCountryController.text.isEmpty){
                          _showMyDialog();
                        } else if (_userStateController.text.isEmpty){
                          _showMyDialog();
                        } else if (_userPinCodeController.text.isEmpty){
                          _showMyDialog();
                        } else if (_userJobController.text.isEmpty) {
                          _showMyDialog();
                        } else {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()
                              )
                          );

                          UserDetail.remainingEntry(
                              _userCountryController.text,
                              _userStateController.text,
                              _userPinCodeController.text,
                              _userSingleMother,
                              _userJobController.text,
                              true
                          );

                        }
                      },
                      child: const Text(
                        "Proceed",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Bebas Neue",
                            fontSize: 18,
                            letterSpacing: 1
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      )
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
