import 'package:flutter/material.dart';

import '../../additional/colors.dart';

class aboutUsScreen extends StatefulWidget {
  const aboutUsScreen({Key? key}) : super(key: key);

  @override
  State<aboutUsScreen> createState() => _aboutUsScreenState();
}

class _aboutUsScreenState extends State<aboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'About Us',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 32.0,
                ),
                Text("The Zone Co."),

              ],
            )),
      ),
    );
  }
}
