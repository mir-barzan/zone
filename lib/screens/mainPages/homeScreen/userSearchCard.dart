import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/screens/mainPages/offerProfile.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../../../additional/colors.dart';

class userSearchCard extends StatefulWidget {
  final OfferId;
  final OwnerId;
  final snap;
  final bool isLocal;
  final snap2;
  final isSearch;

  userSearchCard(
      {Key? key,
      required this.isSearch,
      required this.snap,
      required this.isLocal,
      required this.snap2,
      required this.OwnerId,
      required this.OfferId})
      : super(key: key);

  @override
  _userSearchCard createState() => _userSearchCard();
}

class _userSearchCard extends State<userSearchCard> {
  bool isFavorite = false;
  var snap3 = {};
  List favOffers = [];
  String rrating = '0';
  int commentsLength = 0;
  double totalRate = 0;
  double rate = 0;
  int usercommentsLength = 0;
  double usertotalRate = 0;
  double userrate = 0;
  var offerData = {};
  var userData = {};
  var CurrentUserData = {};

  void getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Category')
          .doc(widget.OfferId)
          .get();
      var snap2 = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      var snap5 = await FirebaseFirestore.instance
          .collection('Category')
          .doc(widget.OfferId)
          .collection('comments')
          .get();
      offerData = snap.data()!;
      var snap4 = await FirebaseFirestore.instance
          .collection('users')
          .doc(offerData['uid'])
          .collection('comments')
          .get();

      var snap6 = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.OwnerId)
          .get();
      userData = snap6.data()!;
      var snapx = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      snap3 = snapx.data()!;
      setState(() {
        favOffers = snap3['favoriteOffers'];
        if (favOffers.contains(widget.snap['offerId'])) {
          setState(() {
            isFavorite = true;
          });
        }
      });
      setState(() {
        commentsLength = snap5.docs.length;
        snap5.docs.forEach((value) {
          var rate = value.data()!['rate'];
          totalRate = totalRate + rate;
        });
        usercommentsLength = snap4.docs.length;
        snap4.docs.forEach((value) {
          var rate = value.data()!['rate'];
          usertotalRate = usertotalRate + rate;
        });
        rate = totalRate / commentsLength;
        userrate = usertotalRate / usercommentsLength;

        CurrentUserData = snap2.data()!;

        rrating = userData['rating'];
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          margin: widget.isSearch ? EdgeInsets.all(5) : null,
          width: screenWidth * 0.9,
          height: screenWidth * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: screenWidth * 0.3,
                    width: screenWidth * 0.3,
                    child: Image.network(
                      widget.snap['profilePhotoUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: offersColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${widget.snap['fname']} ${widget.snap['lname']}\n${widget.snap['bio']}",
                              maxLines: 3,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 35,
                                  ),
                                  Text(
                                    "${userrate.toStringAsFixed(1)}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
