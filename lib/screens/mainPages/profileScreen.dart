import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/fire_auth.dart';
import 'package:zone/screens/auth/login.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../settingsScreens/userSettings.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  String username = "";
  String fname = "";
  String lname = "";
  String rank = "";
  String profilePhotoUrl = "";
  var userData = {};

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getUserFName();
    getUserLName();
    getUserData();
    // getData();
  }

// getData() async{
//     try{
//       var snap = await FirebaseFirestore.instance.collection('users').doc().get();
//       userData = snap.data()!;
//       setState(() {
//         username = userData['username'];
//       });
//     }catch(e){showSnackBar(context, e.toString());}
// }
  // Stream<String> _clock() async* {
  //   // This loop will run forever because _running is always true
  //   await getUserName();
  //   await getUserLName();
  // }

  getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  getUserFName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      fname = (snap.data() as Map<String, dynamic>)['fname'];
    });
  }

  getUserData() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      rank = (snap.data() as Map<String, dynamic>)['rank'];
    });
  }

  getUserLName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      lname = (snap.data() as Map<String, dynamic>)['lname'];
    });
  }

  getProfilePhoto() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      profilePhotoUrl =
          (snap.data() as Map<String, dynamic>)['profilePhotoUrl'];
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 60.0;
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leadingWidth: 110,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text(
            "@$username",
            style: TextStyle(color: secColor),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  //navigateTo(context, const userSettings());
                },
                child: Icon(
                  Icons.adaptive.share,
                  color: secColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  navigateTo(context, const userSettings());
                },
                child: Icon(
                  Icons.settings,
                  color: secColor,
                ),
              ),
            ),
          ],
        ),
        body: Center(
            child: checker(
                username,
                ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            ClipRect(
                              child: Container(
                                height: 350,
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          border:
                                              Border.all(color: primaryColor)),
                                    ),
                                    Container(
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '$fname $lname',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: offersColor),
                                                ),
                                                Text(
                                                  ' @$username',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: offersColor),
                                                ),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          border:
                                              Border.all(color: primaryColor)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  bottom: 8,
                                                  top: 15,
                                                  right: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Offers",
                                                    style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: primaryColor,
                                                        fontSize: 18.0,
                                                        letterSpacing: 4),
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  CircularPercentIndicator(
                                                    circularStrokeCap:
                                                        CircularStrokeCap.butt,
                                                    backgroundColor:
                                                        Colors.white,
                                                    progressColor:
                                                        Colors.grey.shade400,
                                                    radius: 36.0,
                                                    animation: true,
                                                    animationDuration: 2000,
                                                    lineWidth: 6.0,
                                                    percent: 55 / 100,
                                                    center: Text(
                                                      "0",
                                                      style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: primaryColor,
                                                          fontSize: 15.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 5,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              border: Border.all(
                                                  color: primaryColor)),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  bottom: 8,
                                                  top: 15,
                                                  right: 8),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Title",
                                                            style: new TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    primaryColor,
                                                                fontSize: 18.0),
                                                          ),
                                                          Container(
                                                            height: 5,
                                                          ),
                                                          CircularPercentIndicator(
                                                            circularStrokeCap:
                                                                CircularStrokeCap
                                                                    .butt,
                                                            backgroundColor:
                                                                Colors.white,
                                                            progressColor:
                                                                Colors.grey
                                                                    .shade400,
                                                            radius: 36.0,
                                                            animation: true,
                                                            animationDuration:
                                                                2000,
                                                            lineWidth: 6.0,
                                                            percent: 55 / 100,
                                                            center: Text(
                                                              "Junior",
                                                              style: new TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      primaryColor,
                                                                  fontSize:
                                                                      15.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                  color: secColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 280,
                              child: CircleAvatar(
                                radius: 54,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(profilePhotoUrl),
                                  radius: 50,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 260,
                                right: 200,
                                child: badge("medal.svg", 90, 90)),
                            Positioned(
                                bottom: 260,
                                left: 182,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FittedBox(
                                      child: rating(1.0, true, 20),
                                    ),
                                    Container(
                                      width: 12,
                                    ),
                                    Text(
                                      '(2)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Divider(thickness: 2),
                    SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Badges",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: offersColor,
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                    Container(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: secColor),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Divider(thickness: 2),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Skills",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: secColor),
                        ),
                        Icon(
                          Icons.school,
                          color: offersColor,
                          size: 22,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              roundedContainerWithBackground(
                                  "Prgramming", offersColor),
                              SizedBox(
                                height: 20,
                              ),
                              roundedContainerWithBackground(
                                  "Programming", offersColor)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              roundedContainerWithBackground(
                                  "Programming", offersColor),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              roundedContainerWithBackground(
                                  "Programming", offersColor),
                              SizedBox(
                                height: 20,
                              ),
                              roundedContainerWithBackground(
                                  "Programming", offersColor)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "About me",
                              style: TextStyle(
                                  color: secColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Icon(
                              Icons.boy_sharp,
                              color: offersColor,
                              size: 25,
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: offersColor, width: 1)),
                                  child: Text(
                                    "Hi, I am a professional Developer. I graduated from Cyprus international university in 2022 and I am working as a Zoner in The Zone",
                                    style: TextStyle(
                                      color: secColor.withOpacity(0.8),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Portfolio",
                          style: TextStyle(
                              color: secColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 13,
                          crossAxisSpacing: 10,
                          physics: NeverScrollableScrollPhysics(),
                          // to disable GridView's scrolling
                          shrinkWrap: true,
                          // You won't see infinite size error
                          children: <Widget>[
                            portfolioContainer("Logo for Tesla",
                                "https://images.unsplash.com/photo-1601158935942-52255782d322?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80"),
                            portfolioContainer("Logo for Hp",
                                "https://images.unsplash.com/photo-1589561084283-930aa7b1ce50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHB8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                            portfolioContainer("Logo for Intel",
                                "https://images.unsplash.com/photo-1616401014465-0e9f6e4695e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                            portfolioContainer("Logo for Security Company",
                                "https://images.unsplash.com/photo-1639327380081-bf86fc57a7a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80")
                          ],
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
