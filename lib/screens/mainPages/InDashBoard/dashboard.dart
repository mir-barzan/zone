import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/InDashBoard/chats/chatScreen.dart';
import 'package:zone/screens/mainPages/InDashBoard/myOffers.dart';
import '../../../widgets/AdditionalWidgets.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int profit = 4, cost = 23, verification = 44, stints = 55, overAllRating = 1;
  double rateCount = 0.2;
  double userBalance = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: offersColor,
            ),
            onPressed: () {
              null;
            },
          ),
          centerTitle: true,
          title: Expanded(
              child: SvgPicture.asset(
            'assets/images/zoneLogo.svg',
            color: primaryColor,
            width: 180,
          )),
          backgroundColor: offersColor,
          elevation: 0,
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                            child: Icon(
                          Icons.monetization_on,
                          color: offersColor,
                          size: 30,
                        )),
                        FittedBox(
                          child: Text(
                            "  0.0 ",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: offersColor,
                                fontSize: 30.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: ListView(children: [
              Container(
                height: 1,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(5),
              //       height: 50,
              //       width: 100,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(35),
              //           color: offersColor),
              //       child: Row(
              //         children: [
              //           Icon(
              //             Icons.monetization_on,
              //             color: primaryColor,
              //             size: 30,
              //           ),
              //           Text(
              //             " $userBalance ",
              //             style: new TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: primaryColor,
              //                 fontSize: 30.0),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                height: 15,
              ),
              // Expanded(child: Container(width: double.infinity, height: 120,)),
              CarouselSlider(
                options: CarouselOptions(height: 160.0, autoPlay: true),
                items: [
                  'https://images.unsplash.com/photo-1654805202479-317617a76e2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                  'https://images.unsplash.com/photo-1648737154448-ccf0cafae1c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  'https://images.unsplash.com/photo-1654851665266-c6c573737f52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          clipBehavior: Clip.hardEdge,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                i,
                                fit: BoxFit.cover,
                              )));
                    },
                  );
                }).toList(),
              ),

              Container(
                height: 20,
              ),
              //chat and myOffers
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // navigateTo(context, chatScreen());
                            },
                            child: Stack(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: offersColor,
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    height: 120,
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Chat",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor,
                                              fontSize: 25.0),
                                        ),
                                        Icon(
                                          Icons.chat,
                                          color: primaryColor,
                                          size: 35,
                                        )
                                      ],
                                    )),
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 110,
                                    width: 140,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateTo(context, myOffers());
                            },
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: offersColor,
                                          borderRadius:
                                              BorderRadius.circular(22)),
                                      height: 120,
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "My offers",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor,
                                                fontSize: 23.0),
                                          ),
                                          Icon(
                                            Icons.local_offer_sharp,
                                            color: primaryColor,
                                            size: 30,
                                          )
                                        ],
                                      )),
                                  Positioned(
                                    top: 5,
                                    left: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 110,
                                      width: 140,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 28,
              ),
              //withdraw money and ...
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: offersColor,
                                      borderRadius: BorderRadius.circular(22)),
                                  height: 120,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: FittedBox(
                                          child: Text(
                                            "Withdraw",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor,
                                                fontSize: 25.0),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.monetization_on,
                                        color: primaryColor,
                                        size: 28,
                                      )
                                    ],
                                  )),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 110,
                                  width: 140,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: offersColor,
                                      borderRadius: BorderRadius.circular(22)),
                                  height: 120,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "My sales",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                            fontSize: 23.0),
                                      ),
                                      Icon(
                                        Icons.restore_page,
                                        color: primaryColor,
                                        size: 27,
                                      )
                                    ],
                                  )),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 110,
                                  width: 140,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 28,
              ),
              //..... and .....
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: offersColor,
                                      borderRadius: BorderRadius.circular(22)),
                                  height: 120,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Support",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor,
                                                fontSize: 23.0),
                                          ),
                                          Icon(
                                            Icons.contact_support_outlined,
                                            color: primaryColor,
                                            size: 26,
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 110,
                                  width: 140,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: offersColor,
                                      borderRadius: BorderRadius.circular(22)),
                                  height: 120,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: FittedBox(
                                          child: Text(
                                            "Favorites",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor,
                                                fontSize: 23.0),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark,
                                        color: primaryColor,
                                      )
                                    ],
                                  )),
                              Positioned(
                                top: 5,
                                left: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 110,
                                  width: 140,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 15,
              )
            ]),
          ),
        ));
  }
}
