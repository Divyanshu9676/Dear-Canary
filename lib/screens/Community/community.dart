import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  final pageSelected = [true, false, false];

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
      statusBarColor: Color(0xfff3e9de),
      //color set to transparent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

    return Scaffold(

        backgroundColor: const Color(0xfff3e9de),

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


        bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                // Health Post Button
                Container(
                  width: mediaQueryWidth/3,
                  height: mediaQueryHeight * 0.075,
                  decoration: BoxDecoration(
                      color: pageSelected[0] ? Colors.white.withOpacity(0.75) : Colors.black,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40)
                      ),
                      border: Border.all()
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: mediaQueryHeight * 0.01
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          pageSelected[1] = false;
                          pageSelected[2] = false;
                          pageSelected[0] = true;
                        });
                      },
                      child: Image.asset("assets/images/health.png",
                          height: mediaQueryHeight * 0.05),
                    ),
                  ),
                ),

                // Experience Button
                Container(
                  width: mediaQueryWidth/3,
                  height: mediaQueryHeight * 0.075,
                  decoration: BoxDecoration(
                      color: pageSelected[1] ? Colors.white.withOpacity(0.75) : Colors.black,
                      border: Border.all()
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(40)
                      // )
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: mediaQueryHeight * 0.01
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          pageSelected[0] = false;
                          pageSelected[2] = false;
                          pageSelected[1] = true;
                        });
                      },
                      child: Image.asset("assets/images/experience.png",
                          height: mediaQueryHeight * 0.05),
                    ),
                  ),
                ),

                // Chat Button
                Container(
                  width: mediaQueryWidth/3,
                  height: mediaQueryHeight * 0.075,
                  decoration: BoxDecoration(
                      color: pageSelected[2] ? Colors.white.withOpacity(0.75) : Colors.black,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40)
                      ),
                      border: Border.all()
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: mediaQueryHeight * 0.015
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          pageSelected[0] = false;
                          pageSelected[1] = false;
                          pageSelected[2] = true;
                        });
                      },
                      child: Image.asset("assets/images/chat.png",
                          height: mediaQueryHeight * 0.05),
                    ),
                  ),
                ),
            ]


          ),

        body: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/gif/girl_28.gif"
              ),
            ),
            Column(
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
                ])
          ],
        ));
  }
}
