import 'package:flutter/material.dart';
import 'package:zone/widgets/text_field_input.dart';

import '../../../additional/colors.dart';

class informationScreen extends StatefulWidget {
  const informationScreen({Key? key}) : super(key: key);

  @override
  State<informationScreen> createState() => _informationScreenState();
}

class _informationScreenState extends State<informationScreen> {
  final TextEditingController _field1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "I will ",//todo: fix here
                style: TextStyle(fontSize: 24),
              )),
              Expanded(
                child: Container(
                  child: TextField(
                    maxLength: 19,
                    style: TextStyle(fontSize: 24),
                  ),
                  width: 120,
                  height: 80,
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
