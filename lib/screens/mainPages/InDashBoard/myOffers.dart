import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/fire_auth.dart';
import 'package:zone/screens/mainPages/addOfferMain/mainOfferCard.dart';
import 'package:zone/screens/mainPages/editOfferMain/editOffer/editOfferScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class myOffers extends StatefulWidget {
  const myOffers({Key? key}) : super(key: key);

  @override
  State<myOffers> createState() => _myOffersState();
}

class _myOffersState extends State<myOffers> {
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
    super.initState();
    getData();
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
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                    return Stack(children: [
                      Container(
                          child: MainOfferCard(
                        snap: snapshot.data!.docs[index].data(),
                        isLocal: true,
                        snap2: snap2,
                      )),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                navigateTo(
                                    context,
                                    editOfferScreen(
                                        offerId: snapshot.data!.docs[index]
                                            .data()['offerId']));
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Text(
                                      'edit',
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: primaryColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(''),
                                    content: const Text(
                                        "Are you sure you want to Delete this?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: offersColor),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection("Category")
                                              .doc(snapshot.data!.docs[index]
                                                  .data()['offerId'])
                                              .delete();

                                          FirebaseStorage.instance
                                              .refFromURL(snapshot
                                                  .data!.docs[index]
                                                  .data()['PhotoUrl'])
                                              .delete();

                                          Navigator.pop(context, 'OK');
                                        },
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: primaryColor,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]);
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
