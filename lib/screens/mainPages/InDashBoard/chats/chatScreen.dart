import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({Key? key}) : super(key: key);

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  String userId = "";
  var userData = {};

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = snap.data()!;
      userId = userData['uid'];
      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Chat',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 30.0),
          ),
          backgroundColor: offersColor,
          elevation: 0,
          actions: [],
        ),
        body: Center(
          child: Text('Here will be the chat screens'),
        ));
  }
}
