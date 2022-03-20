import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dear_canary/screens/home.dart';

class AboutPPD extends StatefulWidget {
  const AboutPPD({Key? key}) : super(key: key);

  @override
  State<AboutPPD> createState() => _AboutPPDState();
}

class _AboutPPDState extends State<AboutPPD> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.light,
          //set brightness for icons, like dark background light icons
        )
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10,),
                const Text(
                  "About",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const Text(
                  "Postpartum Depression",
                  style: TextStyle(
                      fontFamily: "Lemon Milk",
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: Image.asset(
                    "assets/images/motherBaby.png"
                  ),
                ),
                const Center(
                  child: Text(
                    '"The hand that cradles is the hand that rules the world."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: "Poppins",
                        fontSize: 13
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    children: <TextSpan> [
                      TextSpan(
                        text: "True right?",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        )
                      ),
                      TextSpan(
                          text: "It is beyond our imagination what all mother "
                              "does for their children. Without them, the world "
                              "would fall in a single day. But being a mother "
                              "takes a lot from a woman. A woman endures "
                              "physical, mental, emotional, and physcological "
                              "tolls in order to give a life. Conceiving a baby "
                              "is universally known a stressful thing but what "
                              "about the woman’s health after giving birth? And "
                              "here we are talking not just about her physical "
                              "health but also her mental.",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins",
                              color: Colors.black
                          )
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 40,),
                Center(
                  child: Image.asset(
                    "assets/images/postpartumDepression.png",
                    height: 300,
                  )
                ),
                const SizedBox(height: 20,),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Postpartum Depression is the mental disturbance "
                            "phase new mothers go through. The birth of a baby "
                            "can trigger a jumble of emotions in a woman’s mind."
                            " This is caused by the sudden change in hormones "
                            "after delivery, combined with stress, isolation, "
                            "sleep deprivation, and fatigue. One might feel more"
                            " tearful, overwhelmed, and emotionally fragile "
                            "during these days. The postpartum period generally "
                            "commences after a couple of days of delivery and "
                            "ends within two to three weeks postpartum. But "
                            "some new moms can experience a more severe, "
                            "long-lasting form of depression known as postpartum"
                            " depression. ",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            color: Colors.black
                        ),
                      )
                    ]
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                    child: Image.asset(
                      "assets/images/lyingDepressedWoman.jpg",
                      height: 300,
                    )
                ),
                const SizedBox(height: 20,),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "In the initial days, postpartum depression may "
                              "seem like the normal baby blues. Often postpartum"
                              " depression and baby blues share the same "
                              "symptoms, but obviously, postpartum depression "
                              "varies a lot. Suicidal thoughts or the inability "
                              "to properly nurture your little one are the "
                              "primary stark differences. ",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 15,
                              color: Colors.black
                          ),
                        )
                      ]
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Symptoms",
                  style: TextStyle(
                      fontFamily: "Lemon Milk",
                      fontWeight: FontWeight.bold,
                      fontSize: 23
                  ),
                ),
                const SizedBox(height: 30,),
                Center(
                    child: Image.asset(
                      "assets/images/symptomsPPD.png",

                    )
                ),
                const SizedBox(height: 20,),
                const BulletedList(
                  bullet: Icon(Icons.air),
                  bulletColor: Colors.black,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                    color: Colors.black
                  ),
                  listItems: <String>[
                    "Depressed mood or severe mood swings",
                    "Excessive crying",
                    "Difficulty bonding with your baby",
                    "Withdrawing from family and friends",
                    "Loss of appetite or eating much more than usual",
                    "Inability to sleep (insomnia) or sleeping too much",
                    "Overwhelming fatigue or loss of energy",
                    "Reduced interest and pleasure in activities you used to enjoy",
                    "Intense irritability and anger",
                    "Fear that you're not a good mother",
                    "Hopelessness",
                    "Feelings of worthlessness, shame, guilt or inadequacy",
                    "Diminished ability to think clearly, concentrate or make decisions",
                    "Restlessness",
                    "Severe anxiety and panic attacks",
                    "Thoughts of harming yourself or your baby",
                    "Recurrent thoughts of death or suicide"

                  ],
                ),
                const SizedBox(height: 20,),
              ],
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
      ),
    );
  }
}
