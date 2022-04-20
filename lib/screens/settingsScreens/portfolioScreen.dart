import 'package:flutter/material.dart';

import '../../additional/colors.dart';

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
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Portfolio',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
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
