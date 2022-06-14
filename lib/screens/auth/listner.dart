import 'package:flutter/material.dart';
import 'package:zone/screens/main_page.dart';

class listner extends StatefulWidget {
  const listner({Key? key}) : super(key: key);

  @override
  State<listner> createState() => _listnerState();
}

class _listnerState extends State<listner> {
  @override
  Widget build(BuildContext context) {
    return mainPage(
      isFromSettings: false,
    );
  }
}
