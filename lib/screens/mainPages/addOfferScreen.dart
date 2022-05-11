import 'package:flutter/material.dart';

import '../../additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';

class addOfferScreen extends StatefulWidget {
  const addOfferScreen({Key? key}) : super(key: key);

  @override
  State<addOfferScreen> createState() => _addOfferScreenState();
}

class _addOfferScreenState extends State<addOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        appBar: AppBar(
          leading: Icon(
            Icons.close,
            color: primaryColor,
          ),
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
                  navigatePop(context, widget);
                },
              ),
              padding: EdgeInsets.all(8),
            )
          ],
        ),
        body: Center(child: Text("This is add offer screen")));
  }
}
