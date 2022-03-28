import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:zone/screens/mainPages/dashboard.dart';
import 'package:zone/screens/mainPages/offersScreen.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';
import 'package:zone/screens/mainPages/projectsScreen.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {



  int currentTab = 0;
  final List<Widget> screens = [
    dashboard(),
    projectsScreen(),
    postScreen(),
    offersScreen(),
    profileScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(child: currentScreen ,bucket: bucket,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          currentTab=2;
          currentScreen=postScreen();
        },
        backgroundColor: Colors.lightBlue[800],


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
                    onPressed: (){
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
                          color: currentTab == 0? Colors.lightBlue[900] : Colors.grey,

                        ),
                        Text('Dashboard', style: TextStyle(
                          color: currentTab == 0? Colors.lightBlue[900] : Colors.grey,
                        ),)
                      ],
                    ),


                  ),
                  MaterialButton(

                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = projectsScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work,
                          color: currentTab == 1? Colors.lightBlue[900] : Colors.grey,

                        ),
                        Text('Projects', style: TextStyle(
                          color: currentTab == 1? Colors.lightBlue[900] : Colors.grey,
                        ),)
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
                    onPressed: (){
                      setState(() {
                        currentScreen = offersScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_offer,
                          color: currentTab == 3? Colors.lightBlue[900] : Colors.grey,

                        ),
                        Text('Offers', style: TextStyle(
                          color: currentTab == 3? Colors.lightBlue[900] : Colors.grey,
                        ),)
                      ],
                    ),


                  ),
                  MaterialButton(

                    minWidth: 40,
                    onPressed: (){
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
                          color: currentTab == 4? Colors.lightBlue[900] : Colors.grey,

                        ),
                        Text('Profile', style: TextStyle(
                          color: currentTab == 4? Colors.lightBlue[900] : Colors.grey,
                        ),)
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
