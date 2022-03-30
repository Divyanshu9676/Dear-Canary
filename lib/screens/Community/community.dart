import 'package:dear_canary/screens/Community/health_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_canary/screens/Community/experience.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  Future getPosts() async {
    List itemList = [];
    try {
      await FirebaseFirestore.instance
          .collection("Posts")
          .orderBy("number", descending: true)
          .get()
          .then((querySnapshot) {
        for (var ele in querySnapshot.docs) {
          itemList.add(ele.data());
        }
      });
      return itemList;
    } catch (e) {
      throw (e.toString());
    }
  }

  List posts = [];

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result1 = await getPosts();
    if (result1 == null) {
      throw ("Error");
    } else {
      setState(() {
        posts = result1;
      });
    }
  }

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
                  child: Image.asset("assets/images/bell.png",
                      height: 30, color: const Color(0xFF554E7E)),
                ),

                // Doctor Button
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/bell.png",
                    height: 30,
                    color: const Color(0xFF554E7E),
                  ),
                ),

                // Setting Button
                InkWell(
                  onTap: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Experience()));},
                  child: Image.asset(
                    "assets/images/bell.png",
                    height: 30,
                    color: const Color(0xFF554E7E),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              StreamBuilder(builder: (context, snapshot) {
                return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mediaQueryWidth * 0.02,
                                      vertical: mediaQueryHeight * 0.02),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(posts[index]["Text"]),
                                      ),
                                    ],
                                  )));
                        }));
              })
            ]));
  }
}
