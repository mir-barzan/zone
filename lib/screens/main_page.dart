import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:zone/screens/mainPages/addOfferMain/addOfferScreen.dart';
import 'package:zone/screens/mainPages/addProjectScreen.dart';
import 'package:zone/screens/mainPages/InDashBoard/dashboard.dart';
import 'package:zone/screens/mainPages/OffersScreen.dart';
import 'package:zone/screens/mainPages/leaderboard/leaderboard.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class mainPage extends StatefulWidget {
  final isFromSettings;

  const mainPage({Key? key, required this.isFromSettings}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  void initState() {
    super.initState();
    getData();
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
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboard();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const dashboard(),
      const leaderBoard(),
      const postScreen(),
      const personalOffersScreen(),
      profileScreen(
        uid: FirebaseAuth.instance.currentUser!.uid,
        isVisiting: false,
      )
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigateTo(context, addOfferScreen());
          currentScreen = addOfferScreen();
          currentTab = 0;
        },
        backgroundColor: secColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0
                              ? secColor
                              : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? secColor : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = leaderBoard();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flag,
                          color: currentTab == 1 ? secColor : Colors.grey,
                        ),
                        Text(
                          'Leader',
                          style: TextStyle(
                            color: currentTab == 1 ? secColor : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = personalOffersScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_offer,
                          color: currentTab == 3
                              ? secColor
                              : Colors.grey,
                        ),
                        Text(
                          'Offers',
                          style: TextStyle(
                            color: currentTab == 3
                                ? secColor
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = profileScreen(
                          uid: FirebaseAuth.instance.currentUser!.uid,
                          isVisiting: false,
                        );
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 4
                              ? secColor
                              : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 4
                                ? secColor
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
