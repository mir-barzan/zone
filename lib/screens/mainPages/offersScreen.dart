import 'package:flutter/material.dart';

class offersScreen extends StatefulWidget {
  const offersScreen({Key? key}) : super(key: key);

  @override
  State<offersScreen> createState() => _offersScreenState();
}

class _offersScreenState extends State<offersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome to Offers Screen"),),
    );
  }
}
