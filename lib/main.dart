import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/login.dart';
import 'package:zone/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zone/signup.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {



  @override
  Widget build(BuildContext context) {

    return signup();
  }
}

