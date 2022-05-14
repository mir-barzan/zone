import 'package:flutter/material.dart';

class priceList extends StatefulWidget {
  const priceList({Key? key}) : super(key: key);

  @override
  State<priceList> createState() => _priceListState();
}

class _priceListState extends State<priceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is the price List")),
    );
  }
}
