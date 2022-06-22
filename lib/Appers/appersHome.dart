import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/login1.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class AppersHome extends StatefulWidget {
  const AppersHome({Key? key}) : super(key: key);

  @override
  State<AppersHome> createState() => _AppersHomeState();
}

class _AppersHomeState extends State<AppersHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: FittedBox(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Appers',
              style: TextStyle(fontSize: 50, letterSpacing: 4),
            ),
          )),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Wrap(
                      children: [
                        Container(
                            margin: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(7)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'We are Appers a new company that was found by a group of students at CIU (Cyprus International university) as a mobile apps and games developement junior organization.',
                                  style: TextStyle(letterSpacing: 4)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: FittedBox(
                    child: Row(children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: primaryColor,
                            child: Column(
                              children: [
                                Text('Be the first to try our project'),
                                SvgPicture.asset(
                                  'assets/images/zoneLogo.svg',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            navigateTo(context, login1());
                          },
                          child: FittedBox(
                              child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.black),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/internet.svg',
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Container(
                                      width: 7,
                                    ),
                                    FittedBox(
                                        child: Text(
                                      'Website Beta Available',
                                      style: TextStyle(color: primaryColor),
                                    )),
                                    Container(
                                      width: 5,
                                    ),
                                    FittedBox(
                                        child: Icon(
                                      Icons.subdirectory_arrow_right,
                                      color: primaryColor,
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/apple.svg',
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        Container(
                          width: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.black),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              FittedBox(
                                  child: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: primaryColor,
                              )),
                              Container(
                                width: 5,
                              ),
                              FittedBox(
                                  child: Text(
                                'Comming soon',
                                style: TextStyle(color: primaryColor),
                              )),
                              Container(
                                width: 5,
                              ),
                              FittedBox(
                                  child: Icon(
                                Icons.keyboard_arrow_left_rounded,
                                color: primaryColor,
                              ))
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/play.svg',
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
