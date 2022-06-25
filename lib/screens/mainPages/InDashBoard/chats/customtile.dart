import 'package:flutter/material.dart';

import 'chatMsg.dart';
import 'package:zone/Services/UModel.dart';

class CustomeListViewTileWithActivity extends StatelessWidget {
  final double height;
  final String title;
  final String subtitle;
  final String imagePath;
  final Function onTap;

  CustomeListViewTileWithActivity({
    required this.height,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
