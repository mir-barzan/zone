import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/screens/mainPages/addOfferMain/addOfferScreen.dart';

import '../../additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';
import '../main_page.dart';
import 'addProjectScreen.dart';

class postScreen extends StatefulWidget {
  const postScreen({Key? key}) : super(key: key);

  @override
  State<postScreen> createState() => _postScreenState();
}

class _postScreenState extends State<postScreen> {
  @override
  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.close, color: primaryColor,),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          Padding(
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 25,
                color: secColor,
              ),
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => mainPage(
                              isFromSettings: false,
                            )));
              },
            ),
            padding: EdgeInsets.all(8),
          )
        ],
      ),
      body: Center(
        child: Padding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add a new",
                  style: TextStyle(color: secColor, fontSize: 50.0))
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: TextButton(
                  onPressed: (){
                    navigateTo(context,addProjectScreen() );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(
                    Icons.work,
                    color: secColor,
                    size: 80,
                  ),
                  Text(
                    'Project',
                    style: TextStyle(color: secColor, fontSize: 30.0),
                  ),



            ],
          ),
                ),
        ),
        Container(
          child: TextButton(
            onPressed: (){
              navigateTo(context, addOfferScreen());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_offer,
                  color: offersColor,
                  size: 80,
                ),
                Text(
                  'Offer',
                  style: TextStyle(color: offersColor, fontSize: 30.0),
                )
              ],
            ),
          ),
        )
        ],
      ),
      ],
    ),
    padding: EdgeInsets.all(50),
    ),
    )
    ,
    );
  }
}
