import 'package:flutter/material.dart';

class projectsScreen extends StatefulWidget {
  const projectsScreen({Key? key}) : super(key: key);

  @override
  State<projectsScreen> createState() => _projectsScreenState();
}

class _projectsScreenState extends State<projectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome to Projects Screen"),),
    );
  }
}
