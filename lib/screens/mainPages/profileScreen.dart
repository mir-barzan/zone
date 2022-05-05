import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        rating(4.2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "(1000)",
                              style: TextStyle(color: secColor),
                            )
                          ],
                        )
                      ],
                    )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRect(
                                  child: Container(
                                    height: 180 + 20,
                                    width: width + 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40.0),
                                          topLeft: Radius.circular(40.0),
                                          bottomRight: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0)),
                                      color: rankColor,
                                    ),
                                  ),
                                ),
                                ClipRect(
                                  child: Container(
                                    height: 185,
                                    width: width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 6),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 55,
                                                    backgroundColor: rankColor,
                                                    child: CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          'https://images.unsplash.com/photo-1650476371091-c84969271dbe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                                                      radius: 50,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            whiteTextInDark(
                                                                "$fname", 20),
                                                            whiteTextInDark(
                                                                " ", 20),
                                                            whiteTextInDark(
                                                                "$lname", 20),
                                                          ],
                                                        ),
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    color:
                                                                        rankColor))),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 230,
                                                margin: EdgeInsets.all(2),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: FittedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      FittedBox(
                                                        child: Text(
                                                          "Start a Project with $fname",
                                                          style: TextStyle(
                                                              color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.touch_app_outlined,
                                                        color: primaryColor,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(45),
                                                  border: Border.all(
                                                      color: Colors.green),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 8, bottom: 8, top: 15, right: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Projects",
                                    style: TextStyle(
                                        color: secColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  Divider(),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        color: rankColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                    right:
                                        BorderSide(color: rankColor, width: 2)),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 8, bottom: 8, top: 15, right: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Offers",
                                    style: TextStyle(
                                        color: secColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  Divider(),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        color: rankColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                    right:
                                        BorderSide(color: rankColor, width: 2)),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 8, bottom: 8, top: 15, right: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                        color: secColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Text(
                                    rank,
                                    style: TextStyle(
                                        color: rankColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(45),
                                border: Border.all(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(thickness: 2, color: rankColor),
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
                          color: rankColor,
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
                                  "Prgramming", rankColor),
                              SizedBox(
                                height: 20,
                              ),
                              roundedContainerWithBackground(
                                  "Programming", rankColor)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              roundedContainerWithBackground(
                                  "Programming", rankColor),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              roundedContainerWithBackground(
                                  "Programming", rankColor),
                              SizedBox(
                                height: 20,
                              ),
                              roundedContainerWithBackground(
                                  "Programming", rankColor)
                            ],
                          ),
                        ],
                      ),
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
                              color: rankColor,
                              size: 25,
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Wrap(
                              children: [
                                Text(
                                  "Hi, I am a professional Developer. I graduated from Cyprus international university in 2022 and I am working as a Zoner in The Zone",
                                  style: TextStyle(
                                    color: secColor.withOpacity(0.8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 2, color: rankColor),
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
                          crossAxisCount: 3,
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
