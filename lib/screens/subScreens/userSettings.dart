import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
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
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 16),
              children: [
                ccontainer("Profile Settings"),
                ccontainer("Personal Settings"),
                ccontainer("Security"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                ccontainer("abc"),
                // TODO: fix containers

              ]),
        ),
      ),
    );
  }
}
