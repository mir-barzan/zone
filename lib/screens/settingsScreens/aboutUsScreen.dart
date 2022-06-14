import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: BackButton(
            color: secColor,
          ),
          title: Text(
            'About Us',
            style: TextStyle(color: secColor),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: ListView(children: [
          Container(
            margin: EdgeInsets.all(8),
            decoration:
                BoxDecoration(border: Border.all(color: offersColor, width: 3)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 10,
                ),
                SvgPicture.asset(
                  'assets/images/zoneLogo.svg',
                  width: 250,
                  height: 150,
                ),
                Container(
                    padding: EdgeInsets.all(12),
                    child: Wrap(
                      children: [
                        Text(
                          ' The Zone is a freelancing cooperation which connect people around the world to benefits from each other by selling and buying offers from each other.\n\n First appeareance was at February 2022, a group of students created the application at Cyprus International University as their graduation project.\n\n Now the app has a global accessibility and treats all people as normal users even if they are in an unutilized country.\n\n Currently the app is owned by Appers(A company specialized In Mobile Apps And Games).',
                          style: TextStyle(wordSpacing: 2, letterSpacing: 4),
                        )
                      ],
                    )),
                Container(
                  height: 20,
                ),
                SvgPicture.asset(
                  'assets/images/zoneCheck.svg',
                  width: 150,
                  height: 75,
                ),
                Container(
                  height: 20,
                ),
              ],
            ),
          ),
        ]));
  }
}
