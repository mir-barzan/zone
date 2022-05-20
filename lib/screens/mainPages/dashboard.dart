import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zone/additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int profit = 4, cost = 23, verification = 44, stints = 55, overAllRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: offersColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: ListView(children: [
              Container(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    "Rate",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: offersColor,
                        fontSize: 25.0),
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rating(4.2),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "($overAllRating)",
                            style: TextStyle(color: secColor),
                          )
                        ],
                      )
                    ],
                  )),
                ],
              ),
              Divider(height: 50,thickness: 2,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Profit",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: offersColor,
                                fontSize: 25.0),
                          ),
                          Container(
                            height: 120,
                            width: 150,
                            child: CircularPercentIndicator(
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white,
                              progressColor: offersColor,
                              radius: 45.0,
                              animation: true,
                              animationDuration: 2000,
                              lineWidth: 6.0,
                              percent: profit / 100,
                              center: Text(
                                "$profit \$",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: offersColor,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Cost",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: offersColor,
                                fontSize: 23.0),
                          ),
                          Container(
                            height: 120,
                            width: 150,
                            child: CircularPercentIndicator(
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white,
                              progressColor: offersColor,
                              radius: 45.0,
                              animation: true,
                              animationDuration: 2000,
                              lineWidth: 6.0,
                              percent: cost / 100,
                              center: Text(
                                "$cost \$",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: offersColor,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Stints",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: offersColor,
                                fontSize: 25.0),
                          ),
                          Container(
                            height: 120,
                            width: 150,
                            child: CircularPercentIndicator(
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white,
                              progressColor: offersColor,
                              radius: 45.0,
                              animation: true,
                              animationDuration: 2000,
                              lineWidth: 6.0,
                              percent: stints / 100,
                              center: Text(
                                "$stints",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: offersColor,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Verified",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: offersColor,
                                fontSize: 23.0),
                          ),
                          Container(
                            height: 120,
                            width: 150,
                            child: CircularPercentIndicator(
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white,
                              progressColor: offersColor,
                              radius: 45.0,
                              animation: true,
                              animationDuration: 2000,
                              lineWidth: 6.0,
                              percent: verification / 100,
                              center: Text(
                                "$verification%",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: offersColor,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  DetailsInformation(
                      "Being active will give you badges that increases people trust in the zone")
                ],
              ),
              Divider(
                height: 40,
                thickness: 2,
              ),
              Column(
                children: [
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
                  )
                ],
              ),
              Container(
                height: 5,
              ),
            ]),
          ),
        ));
  }
}
