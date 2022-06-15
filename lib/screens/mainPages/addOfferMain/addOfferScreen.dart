import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zone/Services/changeScreenProvider.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/addOfferMain/imageAndConfigure.dart';
import 'package:zone/screens/mainPages/addOfferMain/information.dart';
import 'package:zone/screens/mainPages/addOfferMain/priceList.dart';
import 'package:zone/screens/mainPages/addOfferMain/reviewAndSubmit.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class addOfferScreen extends StatefulWidget {
  const addOfferScreen({Key? key}) : super(key: key);


  @override
  State<addOfferScreen> createState() => addOfferScreenState();

}

class addOfferScreenState extends State<addOfferScreen> {
  int currentTab = 0;
  Widget currentScreen = informationScreen();

  final List<Widget> screens = [
    informationScreen(),
    imageAndConfigureScreen(),
    priceList(),
    reviewAndSubmit()
  ];

  final PageStorageBucket _bucket = PageStorageBucket();
  bool _isLoading = false;
  //  changeScreen(){
  //    setState(() {
  //      currentScreen = imageAndConfigureScreen();
  //      currentTab = 1;
  //    });
  //
  // }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = informationScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.text_snippet_rounded,
                          color: currentTab == 0
                              ? offersColor
                              : Colors.grey,
                        ),
                        Text(
                          'Info',
                          style: TextStyle(
                            color: currentTab == 0
                                ? offersColor
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
                        currentScreen = imageAndConfigureScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.upload_sharp,
                          color: currentTab == 1
                              ? offersColor
                              : Colors.grey,
                        ),
                        Text(
                          'Upload',
                          style: TextStyle(
                            color: currentTab == 1
                                ? offersColor
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
                        currentScreen = priceList();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money_sharp,
                          color: currentTab == 2
                              ? offersColor
                              : Colors.grey,
                        ),
                        Text(
                          'Price',
                          style: TextStyle(
                            color: currentTab == 2
                                ? offersColor
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
                        currentScreen = reviewAndSubmit();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: currentTab == 3
                              ? offersColor
                              : Colors.grey,
                        ),
                        Text(
                          'Submit',
                          style: TextStyle(
                            color: currentTab == 3
                                ? offersColor
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );

  }

}
