import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dear_canary/models/user_details.dart';
import 'package:dear_canary/screens/Diary/diary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewDiaryEntry extends StatefulWidget {
  var value;
  NewDiaryEntry({Key? key, @required this.value}) : super(key: key);

  @override
  State<NewDiaryEntry> createState() => _NewDiaryEntryState(value);
}

class _NewDiaryEntryState extends State<NewDiaryEntry> {
  _NewDiaryEntryState(this.mobile);
  late String mobile;

  final _userDiaryEntry = TextEditingController();

  bool autoFocusTextFormField = false;

  String getRandomString() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    var namePost = getRandomString(15);
    return namePost;
  }

  // Alert Dialog when entry not found
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
            'No entry found...',
            style: TextStyle(
              fontFamily: "Poppins",

            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                setState(() {
                  autoFocusTextFormField = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Alert Dialog on submitting
  Future<void> _showSubmittedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          content: const Text(
            'Submitted',
            style: TextStyle(
              fontFamily: "Poppins",

            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                setState(() {
                  autoFocusTextFormField = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Diary(value: mobile,))
                );
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
          statusBarColor: Color(0xfffefffe),
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,
          //set brightness for icons, like dark background light icons
        )
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(
          FontAwesomeIcons.arrowAltCircleLeft,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            autoFocusTextFormField = false;
          });
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Stack(
          children: <Widget>[

            // Background Image
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "assets/images/writingDiary.png"
              ),
            ),

            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    // User Diary Entry
                    InkWell(
                      onTap: (){
                        setState(() {
                          autoFocusTextFormField = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 5
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15
                          ),
                          child: SingleChildScrollView(
                            child: TextField(
                              minLines: 50,
                              maxLines: 50,
                              textInputAction: TextInputAction.newline,
                              autofocus: autoFocusTextFormField,
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                              controller: _userDiaryEntry,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Submit Button
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: MediaQuery.of(context).size.height * 0.025
                      ),
                      child: TextButton(
                        onPressed: (){
                          if(_userDiaryEntry.text.isEmpty){
                            _showMyDialog();
                          } else {
                            UserDetail.addDiaryEntry(_userDiaryEntry.text);
                            _showSubmittedDialog();
                            setState(() {
                              autoFocusTextFormField = false;
                            });
                          }
                          try {
                            // Get reference to Firestore collection
                            var docRef =
                            FirebaseFirestore.instance.collection('Dear Canary').doc(mobile).collection("Diary").doc(getRandomString());
                            docRef.set({
                              "Text": _userDiaryEntry.text,
                            });
                          } catch (e) {
                            rethrow;
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.black,
                              fontFamily: "Bebas Neue",
                              fontWeight: FontWeight.bold,
                              fontSize: 35
                          ),
                        ),
                      ),

                    )
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
