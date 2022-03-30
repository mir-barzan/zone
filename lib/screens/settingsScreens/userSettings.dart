import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/settingsScreens/aboutUsScreen.dart';
import 'package:zone/screens/settingsScreens/helpScreen.dart';
import 'package:zone/screens/settingsScreens/personalSettingsScreen.dart';
import 'package:zone/screens/settingsScreens/portfolioScreen.dart';
import 'package:zone/screens/settingsScreens/profileSettingsScreen.dart';
import 'package:zone/screens/settingsScreens/securityScreens.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class userSettings extends StatefulWidget {
  const userSettings({Key? key}) : super(key: key);

  @override
  State<userSettings> createState() => _userSettingsState();
}

class _userSettingsState extends State<userSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(12.0),
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 20 / 8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                  children: [
                    settingButton("Profile Settings", Icons.person_pin,navigateTo(context, profileSettingsScreen())),
                    settingButton("Personal Settings", Icons.person_outline, personalSettingsScreen()),
                    settingButton("Security", Icons.shield_outlined, securityScreens()),
                    settingButton("Portfolio", Icons.photo_album_outlined, portfolioScreen()),
                    settingButton("Help", Icons.help_outline, helpScreen()),
                    settingButton("About Us", Icons.emoji_people_rounded, aboutUsScreen()),

                    // TODO: fix containers
                  ]),
            )),
      ),
    );
  }
}
