import 'package:flutter/material.dart';

class AppersMain extends StatefulWidget {
  const AppersMain({Key? key}) : super(key: key);

  @override
  State<AppersMain> createState() => _AppersMainState();
}

class _AppersMainState extends State<AppersMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Appers",
          style: TextStyle(fontSize: 50),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Coming Soon...',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            Container(
              height: 10,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
