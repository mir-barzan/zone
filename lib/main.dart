import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/screens/auth/login.dart';
import 'package:zone/screens/auth/listner.dart';
import 'package:zone/screens/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zone/screens/auth/signup.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Welcome To The Zone';

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

    return listner();
  }
}

