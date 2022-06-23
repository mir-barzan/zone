import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/InDashBoard/favorites/favoriteCard.dart';
import 'package:zone/screens/mainPages/addOfferMain/mainOfferCard.dart';

class favorites extends StatefulWidget {
  const favorites({Key? key}) : super(key: key);

  @override
  State<favorites> createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  var snap2 = {};
  var snap3 = {};
  List listOfFavorites = [];

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      var snap4 = await FirebaseFirestore.instance
          .collection('Category')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      snap2 = snap.data()!;
      setState(() {
        listOfFavorites = snap2['favoriteOffers'];
      });

      setState(() {});
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
    return SafeArea(
      child: listOfFavorites.isNotEmpty
          ? Scaffold(
              appBar: AppBar(
                backgroundColor: offersColor,
                title: Text(
                  'Favorites',
                  style: TextStyle(color: primaryColor),
                ),
                centerTitle: true,
              ),
              body: ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  print(index);
                  print(listOfFavorites);
                  return Container(
                      margin: EdgeInsets.only(
                          top: 20,
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.2),
                      child: Stack(
                        children: [
                          containers(context, listOfFavorites[index], index),
                          InkWell(
                            onTap: () {
                              try {
                                print('presses');
                                listOfFavorites!.remove(listOfFavorites[index]);
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update(
                                        {'favoriteOffers': listOfFavorites!});
                                Fluttertoast.showToast(
                                    msg: 'Removed from favorites');
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg: 'Please try again later');
                              }
                            },
                            child: Container(
                              width: 30,
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ));
                },
                itemCount: listOfFavorites.length,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: offersColor,
                title: Text(
                  'Favorites',
                  style: TextStyle(color: primaryColor),
                ),
                centerTitle: true,
              ),
              body: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        child: Text(
                      "You don't have any favorites items yet",
                      style: TextStyle(color: Colors.grey),
                    ))),
              )),
    );
  }

  Widget containers(BuildContext context, offerId, index) {
    return favoriteCard(offerId: offerId, isLocal: false);
  }
}
