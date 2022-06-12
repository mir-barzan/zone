import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone/Services/FireStoreSettings.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/addOfferMain/information.dart';
import 'package:zone/screens/mainPages/addOfferMain/offerCard.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import '../../main_page.dart';
import '../OffersScreen.dart';

class reviewAndSubmit extends StatefulWidget {
  const reviewAndSubmit({Key? key}) : super(key: key);

  static ValueNotifier<String> newTitle = ValueNotifier('');
  static ValueNotifier<String> newPrice = ValueNotifier('');
  static ValueNotifier<Uint8List?> newImage = ValueNotifier(Uint8List(0));
  static ValueNotifier<List> category = ValueNotifier([]);
  static ValueNotifier<List> faqAnswer = ValueNotifier([]);
  static ValueNotifier<List> faqQuestion = ValueNotifier([]);
  static ValueNotifier<String> newDiscription = ValueNotifier('');
  static ValueNotifier<String> newtimeNeeded = ValueNotifier('');
  static ValueNotifier<Color> titleColor = ValueNotifier(Colors.red);
  static ValueNotifier<Color> descriptionColor = ValueNotifier(Colors.red);
  static ValueNotifier<Color> tagsColor = ValueNotifier(Colors.red);
  static ValueNotifier<Color> faqColor = ValueNotifier(Colors.red);
  static ValueNotifier<Color> imageColor = ValueNotifier(Colors.red);
  static ValueNotifier<Color> priceColor = ValueNotifier(Colors.red);
  static ValueNotifier<Color> neededTimeColor = ValueNotifier(Colors.red);
  static ValueNotifier<String> titleCount = ValueNotifier('');
  static ValueNotifier<String> descriptionCount = ValueNotifier('');
  static ValueNotifier<String> questionsCount = ValueNotifier('');

  checker() {
    bool x = false;
    if ((newTitle.value.length >= 10) &
        (int.parse(newPrice.value) >= 5) &
        (newImage.value!.isNotEmpty) &
        (category.value.isNotEmpty) &
        (faqAnswer.value.length >= 5) &
        (faqQuestion.value.length >= 5) &
        (newDiscription.value.length >= 100) &
        (newtimeNeeded.value.isNotEmpty)) {
      x = true;
    }

    return x;
  }

  @override
  State<reviewAndSubmit> createState() => _reviewAndSubmitState();
}

class _reviewAndSubmitState extends State<reviewAndSubmit> {
  @override
  String title = "";
  bool _isLoading = false;
  bool _everyThingIsFine = false;
  bool correctTitle = false;
  String fname = '';
  String lname = '';
  String uid = '';
  String rank = '';
  String ratinga = '';
  String username = '';
  Color titleColor = Colors.red,
      descriptionColor = Colors.red,
      categoryColor = Colors.red,
      faqColor = Colors.red,
      priceColor = Colors.red,
      timeColor = Colors.red;

  checkTitle() {
    bool x = false;
    if (reviewAndSubmit.newTitle.value.length >= 10) {
      setState(() {
        x = true;
      });
    }
    print(x);
    return x;
  }

  getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    username = (snap.data() as Map<String, dynamic>)['username'];
  }

  getUserfname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    fname = (snap.data() as Map<String, dynamic>)['fname'];
  }

  getUserlname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    lname = (snap.data() as Map<String, dynamic>)['lname'];
  }

  getUserid() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    uid = (snap.data() as Map<String, dynamic>)['uid'];
  }

  getUserrank() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    rank = (snap.data() as Map<String, dynamic>)['rank'];
  }

  getUserrating() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    ratinga = (snap.data() as Map<String, dynamic>)['rating'];
  }

  void postOffer(categoryTags, title, description, price, file, timeNeeded,
      faqQuestion, faqAnswer) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String result = await FireStoreSettings().uploadOffer(
        _isLoading,
        faqQuestion,
        title,
        description,
        uid,
        price,
        file,
        fname,
        lname,
        username,
        ratinga,
        rank,
        timeNeeded,
        categoryTags,
        faqAnswer,
      );
      if (result == 'success') {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(context, 'posted');
      } else {
        setState(() {
          _isLoading = false;
        });
        showAlertDialog(context, 'errorText', result, Icon(Icons.error));
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserfname();
    getUserlname();
    getUsername();
    getUserrank();
    getUserrating();
    getUserid();
    Timer timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _everyThingIsFine = reviewAndSubmit().checker();
      });
    });
  }

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
              height: 19,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Your Offer",
                            style: TextStyle(fontSize: 25, color: offersColor),
                          ),
                          Icon(
                            Icons.arrow_downward_outlined,
                            size: 30,
                            color: offersColor,
                          ),
                          Container(
                            height: 10,
                          ),
                          Container(
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              height: 410,
              width: 360,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Container(
                child: MultiValueListenableBuilder(
                  valueListenables: [
                    reviewAndSubmit.newTitle,
                    reviewAndSubmit.newPrice,
                    reviewAndSubmit.newImage
                  ],
                  builder: (context, values, child) {
                    // Get the updated value of each listenable
                    // in values list.
                    return Container(
                      width: 350,
                      height: 400,
                      child: new OfferCard(
                              title: values.elementAt(0),
                              price: values.elementAt(1),
                              image: values.elementAt(2))
                          .makeCard(),
                    );
                  },
                ),
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
              child: MultiValueListenableBuilder(
                  valueListenables: [
                    reviewAndSubmit.faqQuestion,
                    reviewAndSubmit.category,
                    reviewAndSubmit.newDiscription,
                    reviewAndSubmit.newImage,
                    reviewAndSubmit.newPrice,
                    reviewAndSubmit.newtimeNeeded,
                    reviewAndSubmit.newTitle,
                    reviewAndSubmit.faqAnswer
                  ],
                  builder: (context, values, child) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                _everyThingIsFine
                                    ? Colors.green
                                    : Colors.grey)),
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: primaryColor,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: 26, color: primaryColor),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: primaryColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                        onPressed: _everyThingIsFine
                            ? () => setState(() {
                                  postOffer(
                                      values.elementAt(1),
                                      values.elementAt(6),
                                      values.elementAt(2),
                                      values.elementAt(4),
                                      values.elementAt(3),
                                      values.elementAt(5),
                                      values.elementAt(0),
                                      values.elementAt(7));

                                  navigateToWithoutBack(
                                      context, personalOffersScreen());
                                })
                            : () => {
                                  showAlertDialog(
                                      context,
                                      "Error",
                                      "You have to fill all the rquirements before submiting your offer !",
                                      Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ))
                                });
                  }),
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

  makeSure() {
    bool x = false;
    MultiValueListenableBuilder(
        valueListenables: [
          reviewAndSubmit.faqQuestion,
          reviewAndSubmit.category,
          reviewAndSubmit.newDiscription,
          reviewAndSubmit.newImage,
          reviewAndSubmit.newPrice,
          reviewAndSubmit.newtimeNeeded,
          reviewAndSubmit.newTitle,
          reviewAndSubmit.faqAnswer
        ],
        builder: (context, values, child) {
          if (values.elementAt(0).isNotEmpty &
              values.elementAt(1).isNotEmpty &
              values.elementAt(2).isNotEmpty &
              values.elementAt(3).isNotEmpty &
              values.elementAt(4).isNotEmpty &
              values.elementAt(5).isNotEmpty &
              values.elementAt(6).isNotEmpty &
              values.elementAt(7).isNotEmpty) {
            x = true;
          }
          return SnackBar(content: Text('${x.toString()}'));
        });
    return x;
  }
}
