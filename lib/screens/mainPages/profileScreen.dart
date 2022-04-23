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
  String lname = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getUserLName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['fname'];
    });
  }

  void getUserLName() async {
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
                  Icons.ios_share,
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
        body: ListView(
          children: [
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
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              height: 180,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40.0),
                                    topLeft: Radius.circular(40.0),
                                    bottomRight: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0)),
                                color: secColor.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                        ClipRect(

                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              height: 180,
                              width: width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 6),
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
                                              backgroundColor: primaryColor,
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
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      whiteTextInDark(
                                                          "$username", 20),
                                                      whiteTextInDark(" ", 20),
                                                      whiteTextInDark("$lname", 20),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: primaryColor))),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(

                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            "I am a professional Programmer",
                                            style: TextStyle(
                                                color: secColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
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
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40.0),
                                    topLeft: Radius.circular(40.0),
                                    bottomRight: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0)),
                                color: secColor.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 200,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 8, bottom: 1, top: 8, right: 1),
                            child: Text(
                              "Zoner",
                              style: TextStyle(
                                  color: secColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: primaryColor),
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [

              Column(children: [
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
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text(
                        "0",
                        style: TextStyle(
                            color: secColor.withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(


                    border: Border(right: BorderSide(color: secColor.withOpacity(0.4))),
                  ),
                ),

              ],),
              Column(children: [
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
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text(
                        "0",
                        style: TextStyle(
                            color: secColor.withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: secColor.withOpacity(0.4))),
                  ),
                ),
              ],),
              Column(children: [

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
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(color: Colors.grey,thickness: 1,),
                      Text(
                        "Zoner",
                        style: TextStyle(
                            color: secColor.withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(color: primaryColor),
                  ),
                ),
              ],),



            ],),
            Divider(thickness: 2,color: secColor.withOpacity(0.4)),
            SizedBox(
              height: 10.0,
            ),

            Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text(
                "About me",
                style: TextStyle(
                    color: secColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hi, I am a professional Developer. I graduated from Cyprus international university in 2022 and I am working as a Zoner in The Zone",
                    style: TextStyle(
                        color: secColor.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],),
            SizedBox(
              height: 10.0,
            ),

            Divider(thickness: 2,color: secColor.withOpacity(0.4)),

          ],
        ));
  }
}
// Icon( Icons.star_border_rounded, color: primaryColor,),
// Icon( Icons.star_border_rounded, color: primaryColor,),
// Icon( Icons.star_border_rounded, color: primaryColor,),
// Icon( Icons.star_border_rounded, color: primaryColor,),
// Icon( Icons.star_border_rounded, color: primaryColor,),
// whiteTextInDark("(Not Rated!)", 14)
