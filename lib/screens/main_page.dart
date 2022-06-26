import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/paymentProcess/pzcoin.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:zone/screens/mainPages/addOfferMain/addOfferScreen.dart';
import 'package:zone/screens/mainPages/addProjectScreen.dart';
import 'package:zone/screens/mainPages/InDashBoard/dashboard.dart';
import 'package:zone/screens/mainPages/OffersScreen.dart';
import 'package:zone/screens/mainPages/leaderboard/leaderboard.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import 'package:showcaseview/showcaseview.dart';

class mainPage extends StatefulWidget {
  final isFromSettings;

  const mainPage({Key? key, required this.isFromSettings}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int selectedIndex = 0;
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  final keyFour = GlobalKey();
  final keyFive = GlobalKey();
  @override
  void initState() {
    super.initState();
    getData();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([
        keyOne,
        keyTwo,
        keyThree,
        keyFour,
        keyFive,
      ]),
    );
  }

  int currentTab = 0;

  var CurrentUserData = {};

  getData() async {
    try {
      var snap2 = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      CurrentUserData = snap2.data()!;

      setState(() {});
    } catch (e) {}
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboard();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const dashboard(),
      const leaderBoard(),
      const postScreen(),
      const personalOffersScreen(),
      profileScreen(
        uid: FirebaseAuth.instance.currentUser!.uid,
        isVisiting: false,
      )
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: offersColor,
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/images/zoneLogo.svg',
            color: primaryColor,
            width: 180,
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      navigateTo(context, const pzcoin());
                    },
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
                ),
              ],
            )
          ],
          bottom: TabBar(
            indicatorColor: primaryColor,
            tabs: [
              Tab(
                  text: 'Home',
                  icon: customeShowcaseWidget(
                    globalKey: keyOne,
                    desccription: 'this will lead you to home screen',
                    child: Icon(Icons.dashboard),
                  )),
              Tab(
                  text: 'Leader',
                  icon: customeShowcaseWidget(
                    globalKey: keyTwo,
                    desccription: 'this will lead you to Leader screen',
                    child: Icon(Icons.flag),
                  )),
              Tab(
                  text: 'Offers',
                  icon: customeShowcaseWidget(
                    globalKey: keyThree,
                    desccription: 'this will lead you to offer screen',
                    child: Icon(Icons.local_offer),
                  )),
              Tab(
                  text: 'Profile',
                  icon: customeShowcaseWidget(
                    globalKey: keyFour,
                    desccription: 'this will lead you to profile screen',
                    child: Icon(Icons.person),
                  )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            dashboard(),
            leaderBoard(),
            personalOffersScreen(),
            profileScreen(
                uid: FirebaseAuth.instance.currentUser!.uid, isVisiting: false)
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(8),
          child: FloatingActionButton(
            child: customeShowcaseWidget(
              globalKey: keyFive,
              desccription: 'this will lead you to Addiing Offer screen',
              child: Icon(Icons.add),
            ),
            onPressed: () {
              navigateTo(context, addOfferScreen());
            },
            backgroundColor: secColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: primaryColor,
      ),
    );
  }
}

class customeShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String desccription;
  final GlobalKey globalKey;

  const customeShowcaseWidget({
    required this.desccription,
    required this.child,
    required this.globalKey,
  });
  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        showcaseBackgroundColor: Colors.pink.shade400,
        contentPadding: EdgeInsets.all(12),
        showArrow: true,
        disableAnimation: false,
        title: 'Hello',
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 32),
        description: desccription,
        descTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        overlayColor: Colors.white,
        overlayOpacity: 0.3,
        child: child,
      );
}
