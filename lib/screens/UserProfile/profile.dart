import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  var value;
  Profile({Key? key, @required this.value}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState(value);
}

class _ProfileState extends State<Profile> {
  _ProfileState(this.mobile);
  late String mobile;
  
  Future getUserList(String docId) async {
    List itemList = [];
    try {
      await FirebaseFirestore.instance
          .collection('Dear Canary').doc(mobile)
          .get()
          .then((querySnapshot) {
        // for (var element in querySnapshot.get(mobile)) {
        itemList.add(querySnapshot.data());
        // }
      });
      return itemList;
    } catch (e) {
      throw(e.toString());
    }
  }

  List user = [];
  String name="";

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await getUserList(mobile);
    if (result == null) {
      print("Error");
    } else {
      setState(() {
        user = result;
        name=user[0]["Name"].toString();
      });
    }
  }
  
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
            ),
          Text(
            name,
            style: const TextStyle(
                fontFamily: "Lemon Milk",
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),
          ),
        ],
      ),
    );
  }
}
