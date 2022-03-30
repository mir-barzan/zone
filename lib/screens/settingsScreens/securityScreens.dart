import 'package:flutter/material.dart';

import '../../additional/colors.dart';

class securityScreens extends StatefulWidget {
  const securityScreens({Key? key}) : super(key: key);

  @override
  State<securityScreens> createState() => _securityScreensState();
}

class _securityScreensState extends State<securityScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Security',
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
                  crossAxisCount: 1,
                  childAspectRatio: 20 / 8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                  children: [


                    // TODO: fix containers
                  ]),
            )),
      ),
    );
  }
}
