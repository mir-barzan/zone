import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("This is dashboard")));
  }
}
