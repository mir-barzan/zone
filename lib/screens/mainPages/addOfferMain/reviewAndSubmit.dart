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
import 'package:zone/screens/mainPages/addOfferMain/offerCard.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import '../../main_page.dart';

class reviewAndSubmit extends StatefulWidget {
  const reviewAndSubmit({Key? key}) : super(key: key);

  static ValueNotifier<String> newTitle = ValueNotifier('');
  static ValueNotifier<String> newPrice = ValueNotifier('');
  static ValueNotifier<Uint8List?> newImage = ValueNotifier(Uint8List(127));
  static ValueNotifier<List> category = ValueNotifier([]);
  static ValueNotifier<List> faq = ValueNotifier([]);
  static ValueNotifier<String> newDiscription = ValueNotifier('');
  static ValueNotifier<String> newtimeNeeded = ValueNotifier('');

  @override
  State<reviewAndSubmit> createState() => _reviewAndSubmitState();
}

class _reviewAndSubmitState extends State<reviewAndSubmit> {
  @override
  String title = "";
  bool _isLoading = false;
  String fname = '';
  String lname = '';
  String uid = '';
  String rank = '';
  String ratinga = '';
  String username = '';

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

  void postOffer(
      categoryTags, title, description, price, file, faq, timeNeeded) async {
    try {
      String result = await FireStoreSettings().uploadOffer(
          _isLoading,
          faq,
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
          categoryTags);
      if (result == 'success') {
        showSnackBar(context, 'posted');
      } else {
        showAlertDialog(context, 'errorText', result,Icon(Icons.error));
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
                  return Container(
                    width: 350,
                    height: 400,
                    child: OfferCard(
                            title: values.elementAt(0),
                            price: values.elementAt(1),
                            image: values.elementAt(2))
                        .makeCard(),
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
              child: MultiValueListenableBuilder(
                  valueListenables: [
                    reviewAndSubmit.faq,
                    reviewAndSubmit.category,
                    reviewAndSubmit.newDiscription,
                    reviewAndSubmit.newImage,
                    reviewAndSubmit.newPrice,
                    reviewAndSubmit.newtimeNeeded,
                    reviewAndSubmit.newTitle,
                  ],
                  builder: (context, values, child) {
                    return ElevatedButton(
                      child: Text("next"),
                      onPressed: () {
                        setState(() {
                          postOffer(
                              values.elementAt(1),
                              values.elementAt(6),
                              values.elementAt(2),
                              values.elementAt(4),
                              values.elementAt(3),
                              values.elementAt(0),
                              values.elementAt(5));

                        });
                      },
                    );
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
}
