import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zone/screens/settingsScreens/Portfolio/AddNewPortfolio.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../../../additional/colors.dart';

class portfolioScreen extends StatefulWidget {
  const portfolioScreen({Key? key}) : super(key: key);

  @override
  State<portfolioScreen> createState() => _portfolioScreenState();
}

class _portfolioScreenState extends State<portfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Expanded(
            child: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        )),
        backgroundColor: offersColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                navigateTo(context, addNewPortfolio());
              },
              child: Icon(
                Icons.add,
                color: primaryColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // TODO create Portfolio
              //TODO maybe removing Portfolio to profile page??
            )),
      ),
    );
  }
}
