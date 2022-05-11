import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../../additional/colors.dart';

class addProjectScreen extends StatefulWidget {
  const addProjectScreen({Key? key}) : super(key: key);

  @override
  State<addProjectScreen> createState() => _addProjectScreenState();
}

class _addProjectScreenState extends State<addProjectScreen> {
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
        body: Center(child: Text("This is add project screen")));
  }
}
