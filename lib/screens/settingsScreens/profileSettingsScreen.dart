import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zone/Services/storageSettings.dart';
import 'package:zone/screens/settingsScreens/personalSettingsScreen.dart';
import 'package:zone/screens/settingsScreens/portfolioScreen.dart';
import 'package:zone/screens/settingsScreens/securityScreens.dart';
import 'package:zone/widgets/text_field_input.dart';

//TODO: Configure backend
import '../../additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';
import '../auth/fire_auth.dart';
import 'aboutUsScreen.dart';
import 'helpScreen.dart';

class profileSettingsScreen extends StatefulWidget {
  const profileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<profileSettingsScreen> createState() => _profileSettingsScreenState();
}

class _profileSettingsScreenState extends State<profileSettingsScreen> {
  @override
  final TextEditingController _skill1 = TextEditingController();
  final TextEditingController _skill2 = TextEditingController();
  final TextEditingController _skill3 = TextEditingController();
  final TextEditingController _skill4 = TextEditingController();
  final TextEditingController _skill5 = TextEditingController();
  final TextEditingController _aboutMe = TextEditingController();
  Uint8List? _image;
  Uint8List? file;
  String photoUrl = "";
  String profilePhotoUrl = '';
  bool _isLoading = false;
  String res = "";
  String profilePho="";
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfilePhoto();

    // getData();
  }
  updateProfilePhoto() async {
    setState(() {
      _isLoading = true;
    });
    String result = await FireAuth()
        .updateCred(oldCred: 'profilePhotoUrl', newCred: profilePho);
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
  setProfilePhoto() async {
    try {

        profilePho = await storageMeth()
            .uploadImageFileToFirebaseStorage(
            'profilePics', _image!, false);


      }catch(e){
      print(e);
    }
  }

  void selectFile() async {
    Uint8List Photo = await selectImage(ImageSource.gallery);
    setState(() {
      _image = Photo;


    });
  }

  getProfilePhoto() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      profilePhotoUrl =
          (snap.data() as Map<String, dynamic>)['profilePhotoUrl'];
    });
    print(profilePhotoUrl);
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Profile Settings',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Change Profile Picture",
                style: TextStyle(
                    color: secColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                    backgroundColor: Colors.red,
                  )
                      :  CircleAvatar(
                    radius: 64,
                    backgroundImage:  NetworkImage(
                        profilePhotoUrl),
                    backgroundColor: Colors.red,
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: () {
                            selectFile();
                            setState(() {

                            });
                          },
                          icon: Icon(
                            Icons.upload_sharp,
                            color: secColor,
                          )))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 18,
            ),
            MaterialButton(
              height: 24,
              child: Text(
                "Change Skills",
                style: TextStyle(
                    color: secColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => errorDialog(context,
                        widget, _skill1, _skill2, _skill3, _skill4, _skill5));
              },
            ),
            SizedBox(
              height: 18,
            ),
            Divider(),
            SizedBox(
              height: 18,
            ),
            Center(
              child: Text(
                "About me",
                style: TextStyle(
                    color: secColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            TextField(
              maxLines: 3,
              maxLength: 120,
              controller: _aboutMe,
            ),
            SizedBox(
              height: 18,
            ),
            TextButton(
                onPressed: () {
                  navigatePop(context, widget);
                  setState(() {
                    setProfilePhoto();
                  });
                  updateProfilePhoto();
                },
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ))
          ],
        ),
      ),
    );
  }
  Dialog errorDialog(
      context,
      widget,
      TextEditingController skill1,
      TextEditingController skill2,
      TextEditingController skill3,
      TextEditingController skill4,
      TextEditingController skill5) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: ListView(
        children: [
          Padding(
            child: Container(
              height: 450.0,
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Skill 1',
                    style: TextStyle(color: secColor),
                  ),
                  TextFieldInput(
                      textEditingController: skill1,
                      hintText: "Please enter skill 1",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Skill 2',
                    style: TextStyle(color: secColor),
                  ),
                  TextFieldInput(
                      textEditingController: skill2,
                      hintText: "Please enter skill 2",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Skill 3',
                    style: TextStyle(color: secColor),
                  ),
                  TextFieldInput(
                      textEditingController: skill3,
                      hintText: "Please enter skill 3",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Skill 4',
                    style: TextStyle(color: secColor),
                  ),
                  TextFieldInput(
                      textEditingController: skill4,
                      hintText: "Please enter skill 4",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Skill 5',
                    style: TextStyle(color: secColor),
                  ),
                  TextFieldInput(
                      textEditingController: skill5,
                      hintText: "Please enter skill 5",
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextButton(
                      onPressed: () {
                        navigatePop(context, widget);
                      },
                      child: Text(
                        'Save Changes',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      ))
                ],
              ),
            ),
            padding: EdgeInsets.all(20),
          )
        ],
      ),
    );

  }

}


