
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/fire_auth.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../../widgets/text_field_input.dart';

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
final TextEditingController _securityWordController = TextEditingController();

class _personalSettingsScreenState extends State<personalSettingsScreen> {
  String username = "";
  String fname = "";
  String lname = "";
  String phoneNumber = "";
  String email = "";
  String securityWord = "";
  var userData = {};
  bool _isLoading = false;
  String res = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getUserFName();
    getUserLName();
    // getUserData();
    getUserEmail();
    // getData();
    getEmail();
    getphoneNumber();
    getSecurityWord();
  }

  updateSecurityWord() async {
    setState(() {
      _isLoading = true;
    });

    String result = await FireAuth()
        .updateCred(
        oldCred: 'securityWord', newCred: _securityWordController.text);
    try {
      if (result != 'success') {
        falseSnackBar(context, result, widget);
        showAlertDialog(
            context,
            "Error!",
            result,
            Icon(
              Icons.error,
              color: Colors.red,
            ));
      } else {
        setState(() {
          res = "success";
        });
        showAlertDialog(
            context,
            "",
            "Success",
            Icon(
              Icons.check,
              color: Colors.green,
            ));
        navigatePop(context, widget);
        trueSnackBar(context, widget);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      falseSnackBar(context, e.toString(), widget);
    }
  }

  updatePhoneNumber() async {
    setState(() {
      _isLoading = true;
    });

    String result = await FireAuth()
        .updateCred(oldCred: 'phone', newCred: _phoneNumber.text);
    try {
      if (result != 'success') {
        falseSnackBar(context, result, widget);
        showAlertDialog(
            context,
            "Error!",
            result,
            Icon(
              Icons.error,
              color: Colors.red,
            ));
      } else {
        setState(() {
          res = "success";
        });
        showAlertDialog(
            context,
            "",
            "Success",
            Icon(
              Icons.check,
              color: Colors.green,
            ));
        navigatePop(context, widget);
        trueSnackBar(context, widget);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      falseSnackBar(context, e.toString(), widget);
    }
  }

  updateFNameandLName() async {
    setState(() {
      _isLoading = true;
    });
    String result1 = await FireAuth()
        .updateCred(oldCred: 'fname', newCred: _fNameController.text);
    String result2 = await FireAuth()
        .updateCred(oldCred: 'lname', newCred: _lNameController.text);
    try {
      if (result1 != 'success') {
        falseSnackBar(context, result1, widget);
        showAlertDialog(
            context,
            "Error!",
            result1 + " " + result2,
            Icon(
              Icons.error,
              color: Colors.red,
            ));
      } else {
        setState(() {
          res = "success";
        });
        showAlertDialog(
            context,
            "",
            "Success",
            Icon(
              Icons.check,
              color: Colors.green,
            ));
        navigatePop(context, widget);
        trueSnackBar(context, widget);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      falseSnackBar(context, e.toString(), widget);
    }
  }

  updateUserName() async {
    setState(() {
      _isLoading = true;
    });
    String result = await FireAuth()
        .updateCred(oldCred: 'username', newCred: _userNameController.text);
    try {
      if (result != 'success') {
        falseSnackBar(context, result, widget);
        showAlertDialog(
            context,
            "Error!",
            result,
            Icon(
              Icons.error,
              color: Colors.red,
            ));
      } else {
        setState(() {
          res = "success";
        });
        showAlertDialog(
            context,
            "",
            "Success",
            Icon(
              Icons.check,
              color: Colors.green,
            ));
        navigatePop(context, widget);
        trueSnackBar(context, widget);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      falseSnackBar(context, e.toString(), widget);
    }
  }

  updateEmail() async {
    setState(() {
      _isLoading = true;
    });
    String result = await FireAuth()
        .updateEmail( newCred: _emailController.text);

    try {
      if (result != 'success'   ) {
        showAlertDialog(
            context,
            "Error!",
            result,
            Icon(
              Icons.error,
              color: Colors.red,
            ));
        falseSnackBar(context, result, widget);
      } else {
        setState(() {
          res = "success";
        });
        showAlertDialog(
            context,
            "",
            "Success",
            Icon(
              Icons.check,
              color: Colors.green,
            ));
        navigatePop(context, widget);
        trueSnackBar(context, widget);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
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
  getphoneNumber() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      phoneNumber = (snap.data() as Map<String, dynamic>)['phone'];
    });
  }
  getEmail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      email = (snap.data() as Map<String, dynamic>)['email'];
    });
  }
  getSecurityWord() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      securityWord = (snap.data() as Map<String, dynamic>)['securityWord'];
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

  // getUserData() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //
  //   setState(() {
  //     rank = (snap.data() as Map<String, dynamic>)['rank'];
  //   });
  // }

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
    return Center(
      child: checker(username,
        Scaffold(
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
                    settingButton2(
                        "Username:",
                        username,
                        context,
                        usernameSettingDialog(
                          context,
                          widget,
                          _userNameController,
                          "Username:",
                          username,
                          _isLoading,
                        )),
                    Divider(),
                    settingButton2(
                        "Name:",
                        "   $fname $lname",
                        context,
                        SettingsDialog2(
                            context,
                            widget,
                            _fNameController,
                            _lNameController,
                            "First Name",
                            fname,
                            "Last Name",
                            lname)),
                    Divider(),
                    settingButton2(
                        "Email:",
                        "   $email",
                        context,
                        emailSettingDialog(
                          context,
                          widget,
                          _emailController,
                          "Email",
                          email,
                          _isLoading,
                        )),
                    Divider(),
                    settingButton2(
                        "Phone Number:", phoneNumber, context,
                        phoneNumberDialog(
                            context, widget, _phoneNumber, "Phone Number",
                            phoneNumber, _isLoading)),
                    Divider(),
                    settingButton2("Security Word:",securityWord, context, securityQuestionDialog(
                        context, widget, _securityWordController, "Security Word", securityWord, _isLoading)),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Dialog usernameSettingDialog(context,
      widget,
      TextEditingController skill1,
      String label,
      String hintText,
      bool IsLoading,) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Padding(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                label,
                style: TextStyle(color: secColor),
              ),
              TextFieldInput(
                  textEditingController: skill1,
                  hintText: hintText,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        navigatePop(context, widget);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )),
                  TextButton(
                      onPressed: () {
                        updateUserName();
                        navigatePop(context, widget);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                super.widget));
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      ))
                ],
              )
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }

  Dialog emailSettingDialog(context,
      widget,
      TextEditingController skill1,
      String label,
      String hintText,
      bool IsLoading,) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Padding(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                label,
                style: TextStyle(color: secColor),
              ),
              TextFieldInput(
                textEditingController: skill1,
                hintText: hintText,
                textInputType: TextInputType.emailAddress,
              ),

              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        navigatePop(context, widget);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )),
                  TextButton(
                      onPressed: () {
                        updateEmail();
                        navigatePop(context, widget);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                super.widget));
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      ))
                ],
              )
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }

  Dialog SettingsDialog2(context,
      widget,
      TextEditingController skill1,
      TextEditingController skill2,
      String label,
      String hintText,
      String label2,
      String hintText2) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Padding(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                label,
                style: TextStyle(color: secColor),
              ),
              TextFieldInput(
                  textEditingController: skill1,
                  hintText: hintText,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              Text(
                label2,
                style: TextStyle(color: secColor),
              ),
              TextFieldInput(
                  textEditingController: skill2,
                  hintText: hintText2,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        navigatePop(context, widget);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )),
                  TextButton(
                      onPressed: () {
                        updateFNameandLName();
                        navigatePop(context, widget);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                super.widget));
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      ))
                ],
              )
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }

  Dialog phoneNumberDialog(context,
      widget,
      TextEditingController skill1,
      String label,
      String hintText,
      bool IsLoading,) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Padding(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                label,
                style: TextStyle(color: secColor),
              ),
              TextFieldInput(
                textEditingController: skill1,
                hintText: hintText,
                textInputType: TextInputType.phone,
              ),

              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        navigatePop(context, widget);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )),
                  TextButton(
                      onPressed: () {
                        updatePhoneNumber();
                        navigatePop(context, widget);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                super.widget));
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      ))
                ],
              )
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }

  Dialog securityQuestionDialog(context,
      widget,
      TextEditingController skill1,
      String label,
      String hintText,
      bool IsLoading,) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Padding(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                label,
                style: TextStyle(color: secColor),
              ),
              TextFieldInput(
                textEditingController: skill1,
                hintText: hintText,
                textInputType: TextInputType.visiblePassword,
              ),

              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        navigatePop(context, widget);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )),
                  TextButton(
                      onPressed: () {
                        updateSecurityWord();
                        navigatePop(context, widget);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                super.widget));
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      ))
                ],
              )
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }

}


