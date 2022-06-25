import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone/Services/FireStoreSettings.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/Services/storageSettings.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/InDashBoard/myOffers.dart';
import 'package:zone/screens/mainPages/addOfferMain/information.dart';
import 'package:zone/screens/mainPages/addOfferMain/offerCard.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import 'editofferCard.dart';

class editreviewAndSubmit extends StatefulWidget {
  final offerId;

  const editreviewAndSubmit({Key? key, required this.offerId})
      : super(key: key);

  static ValueNotifier<String> newTitle = ValueNotifier('');
  static ValueNotifier<String> newPrice = ValueNotifier('');
  static ValueNotifier<Uint8List?> newImage = ValueNotifier(Uint8List(0));
  static ValueNotifier<List> category = ValueNotifier([]);
  static ValueNotifier<List> faqAnswer = ValueNotifier([]);
  static ValueNotifier<List> faqQuestion = ValueNotifier([]);
  static ValueNotifier<String> newDiscription = ValueNotifier('');
  static ValueNotifier<String> newtimeNeeded = ValueNotifier('');
  static ValueNotifier<String> oldPhotoUrl = ValueNotifier('');

  @override
  State<editreviewAndSubmit> createState() => _editreviewAndSubmitState();
}

class _editreviewAndSubmitState extends State<editreviewAndSubmit> {
  @override
  String title = "";
  bool _isLoading = false;
  bool _isTitleFine = false;
  bool _isDescriptionFine = false;
  bool _isTagsFine = false;
  bool _isFaqFine = true;
  bool _isPriceFine = true;
  bool _isDateFine = false;
  bool _everyThingIsFine = false;
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

  void checkAll() {
    int x = 0;
    if (editreviewAndSubmit.newTitle.value.toString().length >= 15) {
      setState(() {
        _isTitleFine = true;
        x += 1;
      });
    }
    if (editreviewAndSubmit.newDiscription.value.toString().length >= 100) {
      setState(() {
        _isDescriptionFine = true;
        x += 1;
      });
    }
    // if (editreviewAndSubmit.faqQuestion.value.length >= 5) {
    //   setState(() {
    //     _isFaqFine = true;
    //     x += 1;
    //   });
    // }
    if (editreviewAndSubmit.category.value.length >= 2) {
      setState(() {
        _isTagsFine = true;
        x += 1;
      });
    }
    // if (int.parse(editreviewAndSubmit.newPrice.value!) >= 5) {
    //   setState(() {
    //     _isPriceFine = true;
    //     x += 1;
    //   });
    // }
    if (editreviewAndSubmit.newtimeNeeded.value.toString().length >= 5) {
      setState(() {
        _isDateFine = true;
        x += 1;
      });
    }
    if (x == 4) {
      _everyThingIsFine = true;
    }
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

  Iterable<Iterable<T>> combinations<T>(
    List<List<T>> lists, [
    int index = 0,
    List<T>? prefix,
  ]) sync* {
    prefix ??= <T>[];

    if (lists.length == index) {
      yield prefix;
    } else {
      for (final value in lists[index]) {
        yield* combinations(lists, index + 1, prefix..add(value));
        prefix.removeLast();
      }
    }
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

  postOffer(categoryTags, title, description, price, file, timeNeeded,
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

        Fluttertoast.showToast(msg: 'Posted successfully');
      } else {
        setState(() {
          _isLoading = false;
        });
        showAlertDialog(context, 'errorText', result, Icon(Icons.error));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please try again later');
    }
  }

  updateOffer(
    title,
    description,
    price,
    Uint8List file,
    timeNeeded,
  ) async {
    String photoUrl = "";

    if (file.isNotEmpty) {
      photoUrl = await storageMeth()
          .uploadImageFileToFirebaseStorage('Offers', file, true);
    }
    setState(() {
      _isLoading = true;
    });
    try {
      if (file.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('Category')
            .doc(widget.offerId)
            .update({
          'title': title,
          'description': description,
          'price': price,
          'PhotoUrl': photoUrl,
          'timeNeeded': timeNeeded
        });
      }

      await FirebaseFirestore.instance
          .collection('Category')
          .doc(widget.offerId)
          .update({
        'title': title,
        'description': description,
        'price': price,
        'timeNeeded': timeNeeded
      });
      Fluttertoast.showToast(msg: 'Updated successfully');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please try again later');
    }
  }

  Timer? timer;
  String OldImageUrl = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAll();
    getUserfname();
    getUserlname();
    getUsername();
    getUserrank();
    getUserrating();
    getUserid();
    // timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
    //   setState(() {
    //     _everyThingIsFine = reviewAndSubmit().checker();
    //   });
    // });
    OldImageUrl = editreviewAndSubmit.oldPhotoUrl.toString();
  }

  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(children: [
        Center(
            child: Column(
          children: [
            Container(
              height: 19,
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
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Container(
                child: MultiValueListenableBuilder(
                  valueListenables: [
                    editreviewAndSubmit.newTitle,
                    editreviewAndSubmit.newPrice,
                    editreviewAndSubmit.newImage,
                    editreviewAndSubmit.oldPhotoUrl
                  ],
                  builder: (context, values, child) {
                    // Get the updated value of each listenable
                    // in values list.
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 400,
                      child: new editOfferCard(
                              title: values.elementAt(0),
                              price: values.elementAt(1),
                              image: values.elementAt(2),
                              imageUrl: values.elementAt(3))
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
                    editreviewAndSubmit.faqQuestion,
                    editreviewAndSubmit.category,
                    editreviewAndSubmit.newDiscription,
                    editreviewAndSubmit.newImage,
                    editreviewAndSubmit.newPrice,
                    editreviewAndSubmit.newtimeNeeded,
                    editreviewAndSubmit.newTitle,
                    editreviewAndSubmit.faqAnswer
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
                                    _isLoading
                                        ? CircularProgressIndicator(
                                            color: primaryColor,
                                          )
                                        : Icon(
                                            Icons.check,
                                            color: primaryColor,
                                            size: 30,
                                          ),
                                  ],
                                ),
                              ),
                        onPressed: _everyThingIsFine
                            ? () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                await updateOffer(
                                    values.elementAt(6),
                                    values.elementAt(2),
                                    values.elementAt(4),
                                    values.elementAt(3),
                                    values.elementAt(5));
                                setState(() {
                                  _isLoading = false;
                                });
                                navigateToWithoutBack(context, myOffers());
                              }
                            : () => {
                                  showSucessDialog(
                                      context,
                                      'Min Title Length: 15',
                                      "Min Description Length: 100",
                                      'Min Category tags: 2',
                                      'Min Price: 5',
                                      "Time Needed",
                                      _isTitleFine
                                          ? Icon(
                                              Icons.check_circle,
                                              color: offersColor,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                      _isDescriptionFine
                                          ? Icon(
                                              Icons.check_circle,
                                              color: offersColor,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                      _isFaqFine
                                          ? Icon(
                                              Icons.check_circle,
                                              color: offersColor,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                      _isPriceFine
                                          ? Icon(
                                              Icons.check_circle,
                                              color: offersColor,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                      _isDateFine
                                          ? Icon(
                                              Icons.check_circle,
                                              color: offersColor,
                                            )
                                          : Icon(
                                              Icons.close,
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

  Future<String> loadString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  makeSure() {
    bool x = false;
    MultiValueListenableBuilder(
        valueListenables: [
          editreviewAndSubmit.faqQuestion,
          editreviewAndSubmit.category,
          editreviewAndSubmit.newDiscription,
          editreviewAndSubmit.newImage,
          editreviewAndSubmit.newPrice,
          editreviewAndSubmit.newtimeNeeded,
          editreviewAndSubmit.newTitle,
          editreviewAndSubmit.faqAnswer
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

  showSucessDialog(BuildContext context, msg1, msg2, msg3, msg5, msg6, icon1,
      icon2, icon3, icon5, icon6) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: offersColor),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: FittedBox(child: Text('Requirements to submit')),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                children: [
                  Text(
                    msg1,
                  ),
                  icon1
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Text(
                    msg2,
                  ),
                  icon2
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Text(
                    msg3,
                  ),
                  icon3
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Text(
                    msg5,
                  ),
                  icon5
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Text(
                    msg6,
                  ),
                  icon6
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
