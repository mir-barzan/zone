import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zone/additional/colors.dart';

import 'mainPages/addOfferMain/mainOfferCard.dart';

class seeUserOffers extends StatefulWidget {
  final uid;

  const seeUserOffers({Key? key, required this.uid}) : super(key: key);

  @override
  State<seeUserOffers> createState() => _seeUserOffersState();
}

class _seeUserOffersState extends State<seeUserOffers> {
  var snap2 = {};

  void getData() async {
    var snapx = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    snap2 = snapx.data()!;
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        ),
        backgroundColor: offersColor,
        elevation: 0,
        actions: [
          //balance
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
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Category')
              .where('uid', isEqualTo: widget.uid)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Expanded(
                child: GridView(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 280,
                  ),
                  children:
                  List<Widget>.generate(snapshot.data!.docs.length, (index) {
                    return Container(
                        child: MainOfferCard(
                          snap: snapshot.data!.docs[index].data(),
                          isLocal: false,
                          snap2: snap2,
                        ));
                  }) +
                      [
                        Center(
                            child: Wrap(
                              children: [
                                Container(
                                  height: 20,
                                )
                              ],
                            ))
                      ] +
                      [
                        Container(
                          height: 1,
                        )
                      ],
                ));
          },
        ),
      ),
    );
  }
}
