import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/screens/mainPages/InDashBoard/chats/chatScreen.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';

import '../../additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';

class offerProfile extends StatefulWidget {
  final uid;
  final ownerUid;

  const offerProfile({Key? key, required this.uid, required this.ownerUid})
      : super(key: key);

  @override
  State<offerProfile> createState() => _offerProfileState();
}

class _offerProfileState extends State<offerProfile> {
  String username = "";
  List<ExpansionTileCard> questions = [];

  var offerData = {};
  var userData = {};

  void initState() {
    super.initState();
    getData();
    getUserData();
  }

  List? ques = [];
  List? answ = [];

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Category')
          .doc(widget.uid)
          .get();
      offerData = snap.data()!;
      username = offerData['username'];

      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  getUserData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.ownerUid)
          .get();
      userData = snap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  assignFAQ() {}

  @override
  Widget build(BuildContext context) {
    ques = offerData['faqQuestion'];
    answ = offerData['faqAnswer'];
    for (int i = 0; i < ques!.length; i++) {
      createQuestionAndAnswer(ques!.elementAt(i), answ!.elementAt(i));
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Expanded(
            child: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        )),
        backgroundColor: offersColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              child: Stack(alignment: Alignment.bottomRight, children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: offersColor, width: 3)),
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    offerData['PhotoUrl'].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 150,
                    left: 308,
                    child: RatingbadgeUp(
                      offerData['rating'],
                      90,
                      90,
                    ))
              ]),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'I will ${offerData['title']}',
                maxLines: 2,
                style: TextStyle(fontSize: 25, color: offersColor),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AllBadges(false, true, false, false, true),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: offersColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Text(
                    "${offerData['price']} \$",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                        fontSize: 30),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Details:',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 27,
                      color: offersColor,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timer_outlined, color: primaryColor),
                      Container(
                        width: 5,
                      ),
                      Text(
                        '${offerData['timeNeeded']}',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: offersColor,
                      borderRadius: BorderRadius.circular(30)),
                )
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${offerData['description']}',
                  maxLines: 50,
                  style: TextStyle(fontSize: 20, color: offersColor),
                ),
              ),
            ),
            Container(
              height: 15,
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            userData['profilePhotoUrl'].toString()),
                        backgroundColor: primaryColor,
                      ),
                      Text(
                        '${userData['fname']} ${userData['lname']} ',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 20,
                            color: offersColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Ratingbadge(
                      userData['rating'],
                      90,
                      90,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateTo(
                            context,
                            profileScreen(
                              uid: userData['uid'],
                              isVisiting: true,
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text(
                              'Visit Profile',
                              style: TextStyle(color: primaryColor),
                            ),
                            Icon(
                              Icons.account_box_outlined,
                              color: primaryColor,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: offersColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Center(
              child: Text(
                'FAQs',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 22,
                    color: offersColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 10,
            ),
            Wrap(
              spacing: 20,
              children: questions,
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              navigateToWithoutBack(
                  context,
                  chatScreen(
                      peerAvatar: userData['profilePhotoUrl'],
                      peerId: userData['uid'],
                      peerName: '${userData['fname']} ${userData['lname']}'));
            },
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: offersColor, borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    'Buy This Offer',
                    style: TextStyle(fontSize: 23, color: primaryColor),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: primaryColor,
                    size: 24,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  createQuestionAndAnswer(String question, String answer) {
    questions.add(ExpansionTileCard(
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: offersColor,
      ),
      expandedTextColor: offersColor,
      title: Text(
        '$question?',
        style: TextStyle(color: offersColor),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Text(
                '$answer.',
                style: TextStyle(color: offersColor),
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    ));

    setState(() {});
  }
}
