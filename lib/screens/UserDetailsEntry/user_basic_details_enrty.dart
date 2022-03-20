import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dear_canary/models/user_details.dart';
import 'package:dear_canary/screens/InitialQuiz/initial_questioning.dart';
import 'package:dear_canary/screens/UserDetailsEntry/user_remaining_data_entry.dart';
import 'package:dear_canary/screens/intro_page_1.dart';

class BasicDataEntry extends StatefulWidget {
  const BasicDataEntry({Key? key}) : super(key: key);

  @override
  State<BasicDataEntry> createState() => _BasicDataEntryState();
}

class _BasicDataEntryState extends State<BasicDataEntry> {
  final _userNameController = TextEditingController();
  final _userChildNoController = TextEditingController();
  final _userDOBController = TextEditingController();

  DateTime currentDate = DateTime.now();
  DateTime? _userBirthDate ;
  DateTime? _userDeliveryDate;

  double animatedContainerHeight = 60;

  bool _userCurrentlyPregnant = true;
  bool _animatedContainerSelected = false;

  // Function to pick date for user DOB
  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2030)
    );
    if (picked != null && picked != _userBirthDate) {
      setState(() {
        _userBirthDate = picked;
        _userDOBController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  // Function to pick date when user delivered her child
  Future<void> _selectDeliveryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2030)
    );
    if (picked != null && picked != _userDeliveryDate) {
      setState(() {
        _userDeliveryDate = picked;
      });
    }
  }

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        resizeToAvoidBottomInset: false,
        // To place gif at bottom of the screen
        bottomNavigationBar: Image.asset(
          "assets/gif/girl_3.gif",
          height: 190,
        ),
        backgroundColor: const Color(0xffffed87),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),

                // "Before we start" Text
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Before we start...",
                    style: TextStyle(
                        fontFamily: "Bebas Neue",
                        fontSize: 35
                    ),
                  ),
                ),

                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10,),
                      //Name
                      Container(
                        height: 60,
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: _userNameController,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            // fontWeight: FontWeight.bold
                          ),
                          onTap: (){
                            setState(() {
                              _animatedContainerSelected = false;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: const TextStyle(
                                fontFamily: "Bebas Neue",
                                // color: Colors.white
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 5
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 5
                                  )
                              )
                          ),
                        ),
                      ),

                      //DOB
                      Container(
                        height: 60,
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          onTap: (){
                            _selectBirthDate(context);
                            _animatedContainerSelected = false;
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20
                          ),
                          readOnly: true,
                          controller: _userDOBController,
                          decoration: InputDecoration(
                              suffixIcon: const Padding(
                                child: FaIcon(
                                  FontAwesomeIcons.calendar,
                                  size: 25,
                                ),
                                padding: EdgeInsets.fromLTRB(0,8.5,0,0),
                              ),
                              iconColor: Colors.black,

                              labelText: "Date of Birth",
                              labelStyle: const TextStyle(
                                fontFamily: "Bebas Neue",
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 5
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 5
                                  )
                              )
                          ),
                        ),
                      ),

                      //Child Delivered
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 0),
                        height: animatedContainerHeight,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: _animatedContainerSelected ?
                                Colors.white:
                                Colors.grey,
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
                                      "Currently Pregnant?",
                                      style: TextStyle(
                                          color: Color(0xff665e37),
                                          fontFamily: "Bebas Neue",
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Switch(
                                      value: _userCurrentlyPregnant,
                                      onChanged: (value){
                                        setState(() {
                                          _animatedContainerSelected = true;
                                          animatedContainerHeight == 60 ?
                                          animatedContainerHeight = 90:
                                          animatedContainerHeight = 60;
                                          _userCurrentlyPregnant = value;
                                        });
                                      }
                                  )
                                ]
                            ),
                            if (!_userCurrentlyPregnant)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      "Delivered on:",
                                      style: TextStyle(
                                          color: Color(0xff665e37),
                                          fontFamily: "Bebas Neue",
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      _userDeliveryDate == null ?
                                      "                          ":
                                      DateFormat('dd-MM-yyyy').format(_userDeliveryDate!).toString(),
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 20,
                                          decoration: TextDecoration.underline
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    child: InkWell(
                                      onTap: (){
                                        _selectDeliveryDate(context);

                                      },
                                      child: const FaIcon(
                                        FontAwesomeIcons.calendar,
                                        size: 25,
                                      ),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(0,0,10,5),
                                  ),
                                ],
                              )
                          ],

                        ),
                      ),

                      //Child Number
                      Container(
                        height: 60,
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: _userChildNoController,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onTap: (){
                            setState(() {
                              _animatedContainerSelected = false;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: "Child Number",
                              labelStyle: const TextStyle(
                                fontFamily: "Bebas Neue",
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 5
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 5
                                  )
                              )
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),

                      // Proceed Button
                      ElevatedButton(
                          onPressed: (){

                            if(_userNameController.text.isEmpty){
                              _showMyDialog();
                            } else if (!_userCurrentlyPregnant && _userDeliveryDate == null){
                              _showMyDialog();
                            } else if (_userChildNoController.text.isEmpty) {
                              _showMyDialog();
                            }
                            else{
                              // To store basic entry data in user's model
                              if (!_userCurrentlyPregnant){
                                UserDetail.basicEntryWithDeliveryDate(
                                    _userNameController.text,
                                    _userBirthDate!,
                                    _userCurrentlyPregnant,
                                    _userDeliveryDate!,
                                    int.parse(_userChildNoController.text)
                                );
                              } else {
                                UserDetail.basicEntryWithoutDeliveryDate(
                                    _userNameController.text,
                                    _userBirthDate!,
                                    _userCurrentlyPregnant,
                                    int.parse(_userChildNoController.text)
                                );
                              }


                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const IntroToInitialQuiz()
                                  )
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
                )

              ],
            ),
          )

        ),
      ),
    );
  }
}
