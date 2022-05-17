import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/addOfferMain/offerCard.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import '../../main_page.dart';

class reviewAndSubmit extends StatefulWidget {
  const reviewAndSubmit({Key? key}) : super(key: key);

  static ValueNotifier<String> newTitle = ValueNotifier('');
  static ValueNotifier<int> newPrice = ValueNotifier(0);
  static ValueNotifier<Uint8List?> newImage = ValueNotifier(Uint8List(127));

  @override
  State<reviewAndSubmit> createState() => _reviewAndSubmitState();
}

class _reviewAndSubmitState extends State<reviewAndSubmit> {
  @override
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: CancelIcon(),
        title: Wrap(children: [
          Text(
            "New Offer",
            style: TextStyle(fontSize: 34, color: offersColor),
          ),
          Container(
              height: 50,
              width: 50,
              child: Icon(
                Icons.local_offer,
                color: offersColor,
              )),
        ]),
        actions: [],
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 1,
      ),
      body: ListView(children: [
        Center(
            child: Column(
          children: [
            Container(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    DetailsInformation(
                        "This is how your offer will be shown in the Offers page"),
                  ],
                )
              ],
            ),
            Container(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  "Your Offer",
                  style: TextStyle(fontSize: 30, color: offersColor),
                ),
                Container(
                  height: 10,
                ),
                Icon(
                  Icons.arrow_downward,
                  size: 50,
                  color: offersColor,
                )
              ],
            ),
            Container(
              child: MultiValueListenableBuilder(
                valueListenables: [
                  reviewAndSubmit.newTitle,
                  reviewAndSubmit.newPrice,
                  reviewAndSubmit.newImage
                ],
                builder: (context, values, child) {
                  // Get the updated value of each listenable
                  // in values list.
                  return values.elementAt(2) != null
                      ? Container(
                          width: 350,
                          height: 400,
                          child: OfferCard(
                                  title: values.elementAt(0),
                                  price: values.elementAt(1),
                                  image: values.elementAt(2))
                              .makeCard(),
                        )
                      : Container(
                          child: Wrap(spacing: 0, children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                        color: Colors.deepOrange,
                                        height: 219,
                                        width: double.infinity,
                                        child: Center(
                                          child: Icon(Icons.image),
                                        ),
                                      )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40)),
                                  color: offersColor),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'I will $title',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: primaryColor),
                                      ),
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      color: primaryColor,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(40),
                                                  bottomRight:
                                                      Radius.circular(40))),
                                          child: Text(
                                            "0",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: offersColor,
                                                fontSize: 25),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "(0)",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: primaryColor,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.adaptive.share,
                                                color: primaryColor,
                                              ),
                                            ),
                                            Text(
                                              "Share",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: primaryColor),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                CupertinoIcons.plus_app,
                                                color: primaryColor,
                                              ),
                                            ),
                                            Text(
                                              "Add to favorites",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: primaryColor),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        );
                },
              ),
            ),
            Container(
              height: 20,
            ),
            Divider(
              height: 25,
              thickness: 2,
            ),
            Container(
              height: 50,
              width: 220,
              child: ElevatedButton(
                onPressed: () {
                  //todo validation
                },
                child: Icon(
                  Icons.check,
                  size: 45,
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: offersColor),
              ),
            ),
            Container(
              height: 20,
            ),
          ],
        )),
      ]),
    );
  }

  CancelIcon() {
    return IconButton(
        onPressed: () {
          setState(() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(""),
                  content: Text("Are you sure you want to leave?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          navigatePop(context, widget);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: offersColor),
                        )),
                    TextButton(
                        onPressed: () {
                          navigateToWithoutBack(context, mainPage());
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(color: offersColor),
                        )),
                  ],
                );
                ;
              },
            );
          });
        },
        icon: Icon(
          Icons.close,
          color: Colors.black,
        ));
  }

  Future<String> loadString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
}
