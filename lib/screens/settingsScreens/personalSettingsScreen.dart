import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class personalSettingsScreen extends StatefulWidget {
  const personalSettingsScreen({Key? key}) : super(key: key);

  @override
  State<personalSettingsScreen> createState() => _personalSettingsScreenState();
}
final TextEditingController _userNameController = TextEditingController();
final TextEditingController _fNameController = TextEditingController();
final TextEditingController _lNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _securityQuestionController = TextEditingController();
class _personalSettingsScreenState extends State<personalSettingsScreen> {
  String username = "";
  String fname = "";
  String lname = "";
  String rank = "";
  String email = "";
  var userData = {};

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getUserFName();
    getUserLName();
    getUserData();
    getUserEmail();
    // getData();
  }
  getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }
  getUserEmail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      email = (snap.data() as Map<String, dynamic>)['email'];
    });
  }
  getUserFName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      fname = (snap.data() as Map<String, dynamic>)['fname'];
    });
  }

  getUserData() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      rank = (snap.data() as Map<String, dynamic>)['rank'];
    });
  }

  getUserLName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      lname = (snap.data() as Map<String, dynamic>)['lname'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Personal Settings',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                settingButton2("Username", username, context, SettingsDialog(context, widget, _userNameController , "Username", username)),
                Divider(),
                settingButton2("Name:", "   $fname $lname", context, SettingsDialog2(context, widget, _fNameController ,_lNameController, "First Name", fname,"Last Name",lname )),
                Divider(),
                settingButton2(
                    "Email:", "   $email", context, SettingsDialog(context, widget, _emailController , "Email", email)),
                Divider(),
                settingButton2(
                    "Phone Number:", "   05338548187", context, widget),
                Divider(),
                settingButton2("Security Question:", "   ...", context, widget),
              ],
            )),
      ),
    );
  }
}
