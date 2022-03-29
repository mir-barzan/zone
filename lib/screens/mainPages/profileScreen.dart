import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/fire_auth.dart';
import 'package:zone/screens/auth/login.dart';
import 'package:zone/screens/subScreens/userSettings.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  String username = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['fname'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(onTap:(){navigateTo(context, const userSettings());},
              child: Icon(Icons.settings, color: secColor,),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome  ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '$username',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 60,),
            InkWell(

              onTap: () async {
                await FireAuth().signOut();
                navigateToWithoutBack(context, login());
              },
              child: Container(
                  child: Text(
                    'Log out', style: (TextStyle(color: primaryColor)),),
                  alignment: Alignment.center,
                  width: 150,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            4))),
                    color: secColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
