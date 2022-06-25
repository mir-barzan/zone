import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';
import 'package:zone/screens/settingsScreens/Portfolio/AddNewPortfolio.dart';
import 'package:zone/screens/settingsScreens/Portfolio/MainPortfolioCard.dart';
import 'package:zone/screens/settingsScreens/userSettings.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../../../additional/colors.dart';
import '../../mainPages/addOfferMain/mainOfferCard.dart';

class portfolioScreen extends StatefulWidget {
  final bool isAfterAddingANewPortfolio;

  const portfolioScreen({Key? key, required this.isAfterAddingANewPortfolio})
      : super(key: key);

  @override
  State<portfolioScreen> createState() => _portfolioScreenState();
}

class _portfolioScreenState extends State<portfolioScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.isAfterAddingANewPortfolio == true) {
      Future.delayed(
          Duration(milliseconds: 100),
          () => showAlertDialog(
              context,
              "Sucess",
              "Your Portfolio has been successfully Added",
              Icon(
                Icons.check_circle,
                color: offersColor,
                size: 50,
              )));
    }
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            navigateToWithoutBack(context, userSettings(isAfterChange: false));
          },
        ),
        centerTitle: true,
        title: Text('Your Portfolio'),
        backgroundColor: offersColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                navigateTo(context, addNewPortfolio());
              },
              child: Icon(
                Icons.add,
                color: primaryColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Portfolio')
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
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 200,
                    ),
                    children: List<Widget>.generate(snapshot.data!.docs.length,
                            (index) {
                          return Container(
                              padding: EdgeInsets.only(right: 70, left: 70),
                              child: MainPortfolioCard(
                                snap: snapshot.data!.docs[index].data(),
                                isLocal: true,
                              ));
                        }) +
                        [
                          Container(
                            height: 20,
                          )
                        ] +
                        [
                          Container(
                            height: 1,
                          )
                        ]));
          },
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(8),
          child: Wrap(
            children: [
              Text('You can add a new portfolio using'),
              Icon(Icons.add),
              Text(' Button')
            ],
          )),
    );
  }
}
