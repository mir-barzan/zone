import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imageAndConfigureScreen extends StatefulWidget {
  const imageAndConfigureScreen({Key? key}) : super(key: key);

  @override
  State<imageAndConfigureScreen> createState() => _imageAndConfigureScreenState();
}

class _imageAndConfigureScreenState extends State<imageAndConfigureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is the image And Configure Screen")),
    );
  }
}
