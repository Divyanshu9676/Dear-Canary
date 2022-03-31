import 'package:dear_canary/screens/ConfidenceBooster/confidence_booster.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityHealth extends StatefulWidget {
  const CommunityHealth({Key? key}) : super(key: key);

  @override
  State<CommunityHealth> createState() => _CommunityHealthState();
}

class _CommunityHealthState extends State<CommunityHealth> {
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
        print(posts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Stack(children: <Widget>[
      Align(
        child: Image.asset("assets/gif/girl_28.gif"),
      ),
      posts.isNotEmpty
          ? SizedBox(
              height: mediaQueryHeight * 0.95,
              child: Center(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: ListTile(
                              tileColor: Colors.orange,
                              title: Text(
                                posts[index]["Text"],
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: "Dongle",
                                    color: Colors.white),
                              ),
                            ));
                          })),
            )
          : SizedBox(
              height: mediaQueryHeight * 0.95,
              child: const Center(
                child: Text(
                  "No posts yet",
                  style: TextStyle(
                      fontSize: 80, fontFamily: "Dongle", color: Colors.yellowAccent),
                ),
              ))
    ]));
  }
}
