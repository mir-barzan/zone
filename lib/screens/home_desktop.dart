import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:zone/screens/mainPages/addOfferScreen.dart';
import 'package:zone/screens/mainPages/addProjectScreen.dart';
import 'package:zone/screens/mainPages/dashboard.dart';
import 'package:zone/screens/mainPages/offersScreen.dart';
import 'package:zone/screens/mainPages/personalOffersScreen.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';
import 'package:zone/screens/mainPages/optimizedSearch/projectsScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class home_desktop extends StatefulWidget {
  const home_desktop({Key? key}) : super(key: key);

  @override
  State<home_desktop> createState() => _home_desktopState();
}

class _home_desktopState extends State<home_desktop> {
  int currentTab = 0;
  final List<Widget> screens = [
    dashboard(),
    projectsScreen(),
    postScreen(),
    personalOffersScreen(),
    profileScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboard();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      appBar: AppBar(
        backgroundColor: secColor,
        centerTitle: false,
        shape: CircleBorder(),
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 32,
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
                          color: currentTab == 0 ? secColor : Colors.grey,
                        ),
                        Text(
                          'Dashboard',
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
                        currentScreen = projectsScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.select_all,
                          color: currentTab == 1 ? secColor : Colors.grey,
                        ),
                        Text(
                          'Search',
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
                          color: currentTab == 3 ? secColor : Colors.grey,
                        ),
                        Text(
                          'Offers',
                          style: TextStyle(
                            color: currentTab == 3 ? secColor : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = profileScreen();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 4 ? secColor : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 4 ? secColor : Colors.grey,
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
