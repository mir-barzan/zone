import 'package:flutter/material.dart';
import 'package:zone/screens/settingsScreens/personalSettingsScreen.dart';
import 'package:zone/screens/settingsScreens/portfolioScreen.dart';
import 'package:zone/screens/settingsScreens/securityScreens.dart';

import '../../additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';
import 'aboutUsScreen.dart';
import 'helpScreen.dart';

class profileSettingsScreen extends StatefulWidget {
  const profileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<profileSettingsScreen> createState() => _profileSettingsScreenState();
}

class _profileSettingsScreenState extends State<profileSettingsScreen> {
  @override
  List<String> ex5 = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Profile Settings',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Change Profile Picture",
                style: TextStyle(
                    color: secColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/zone-b3608.appspot.com/o/profileAvatar.png?alt=media&token=19b38fea-2248-4e61-a886-13d4f4a27caa'),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.upload_sharp,
                            color: secColor,
                          )))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Choose skills",
                style: TextStyle(
                    color: secColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            RaisedButton(
              onPressed: () {
                //TODO: working here
    showDialog(context: context, builder: (BuildContext context) => errorDialog(context,widget));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
Dialog errorDialog(context, widget) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    //this right here
    child: Container(
      height: 300.0,
      width: 300.0,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Cool', style: TextStyle(color: Colors.red),),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Awesome', style: TextStyle(color: Colors.red),),
          ),
          Padding(padding: EdgeInsets.only(top: 50.0)),
          TextButton(onPressed: () {
            navigatePop(context, widget);
          },
              child: Text('Got It!',
                style: TextStyle(color: Colors.purple, fontSize: 18.0),))
        ],
      ),
    ),
  );
}