import 'package:flutter/material.dart';

class reviewAndSubmit extends StatefulWidget {
  const reviewAndSubmit({Key? key}) : super(key: key);

  @override
  State<reviewAndSubmit> createState() => _reviewAndSubmitState();
}

class _reviewAndSubmitState extends State<reviewAndSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is the Review and Submit screen")),
    );
  }
}
