import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text("Hello Zone"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white38 ,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Main")
      ,
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile")
        ,
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings")
        ],

      ),
    );
  }
}
