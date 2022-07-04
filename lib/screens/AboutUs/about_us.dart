import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dear_canary/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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

                // Our Vision
                const SizedBox(height: 10,),
                const Text(
                  "Our",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const Text(
                  "Vision",
                  style: TextStyle(
                      fontFamily: "Lemon Milk",
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
               const SizedBox(height: 5,),
                Center(
                  child: Image.asset(
                      "assets/gif/girl_16(1).gif"
                  ),
                ),
                const SizedBox(height: 10,),
                const Center(
                  child: Text(
                    "You're like a grey sky.\nYou're beautiful even though you don't want to be.",
                    textAlign: TextAlign.center ,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: "Poppins",
                        fontSize: 13
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "We live in a world where half the population is"
                              " female, and every female experiences the bliss "
                              "of motherhood at some point in their life. The "
                              "Postpartum Depression target rate is increasing "
                              "with the increasing population. Nowadays, the "
                              "global prevalence of PPD is 100-150 per 1000 "
                              "births. PPD can be very toll taking on the health"
                              " of a woman. We, at 'dear Canary', want to "
                              "create a world where women can come up and break "
                              "free of PPD. We want to live in a world where the"
                              " masses know what Postpartum Depression is, and "
                              "no one goes neglected. We want to create "
                              "awareness among the crowd so that people can help"
                              " new mothers in their struggles. The women "
                              "community is progressing but somehow new mothers "
                              "somewhere get neglected. Not being able to "
                              "express their suffering hidden under joy can be a"
                              " threat to their mental health. 'dear Canary' "
                              "wants to work for this cause believing that any "
                              "type of mental health is a menace to everyone.",
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
                const Divider(
                  color: Colors.black,
                ),

                // Our Team
                const SizedBox(height: 20,),
                const Text(
                  "Our",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const Text(
                  "Team",
                  style: TextStyle(
                      fontFamily: "Lemon Milk",
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                const SizedBox(height: 20,),

                // Abhay K. Mittal
                Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                            "assets/images/abhay.jpg"
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Text(
                        "Abhay Kumar Mittal",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap:  () async {
                              const url = 'https://www.instagram.com/mitabhay/';
                              if(await canLaunch(url)){
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Image.asset(
                              "assets/images/instagram.png",
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap:  () async {
                              const url = 'https://www.linkedin.com/in/mitabhay/';
                              if(await canLaunch(url)){
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Image.asset(
                              "assets/images/linkedin.png",
                              height: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Divider(),

                // Anurag Tripathi
                Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                            "assets/images/anurag.jpg"
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Text(
                        "Anurag Tripathi",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap:  () async {
                              const url = 'https://www.instagram.com/_lmao._.ded_/';
                              if(await canLaunch(url)){
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Image.asset(
                              "assets/images/instagram.png",
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap:  () async {
                              const url = 'https://www.linkedin.com/in/anurag-tripathi-7422291b4/';
                              if(await canLaunch(url)){
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Image.asset(
                              "assets/images/linkedin.png",
                              height: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Divider(),

                // Divyanshu Singh
                Center(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                            "assets/images/divyanshu.jpeg"
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Text(
                        "Divyanshu Singh",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap:  () async {
                              const url = 'https://www.instagram.com/divyu50/';
                              if(await canLaunch(url)){
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Image.asset(
                              "assets/images/instagram.png",
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap:  () async {
                              const url = 'https://www.linkedin.com/in/divyanshu9676/';
                              if(await canLaunch(url)){
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Image.asset(
                              "assets/images/linkedin.png",
                              height: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),

                const SizedBox(height: 20,),
                const Divider(
                  color: Colors.black,
                ),

                // User Feedback
                const SizedBox(height: 20,),
                const Text(
                  "Your",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const Text(
                  "Feedback",
                  style: TextStyle(
                      fontFamily: "Lemon Milk",
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                const SizedBox(height: 20,),
                const UserFeedback(),

                const SizedBox(height: 20,),
                const Divider(
                  color: Colors.black,
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

class UserFeedback extends StatefulWidget {
  const UserFeedback({Key? key}) : super(key: key);

  @override
  _UserFeedbackState createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {

  final _userFeedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          minLines: 1,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          controller: _userFeedbackController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: (){},
          child: const Text(
            "Submit",
            style: TextStyle(
              fontFamily: "Poppins"
            ),
          ),

        )
      ],
    );
  }
}
