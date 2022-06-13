import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zone/Services/storageSettings.dart';
import 'package:zone/screens/mainPages/addOfferMain/information.dart';
import 'package:zone/screens/settingsScreens/personalSettingsScreen.dart';
import 'package:zone/screens/settingsScreens/Portfolio/portfolioScreen.dart';
import 'package:zone/screens/settingsScreens/securityScreens.dart';
import 'package:zone/screens/settingsScreens/userSettings.dart';
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
  TextEditingController _aboutMe = new TextEditingController();
  TextEditingController _controller = new TextEditingController();

  Uint8List? _image;
  Uint8List? file;
  String photoUrl = "";
  String profilePhotoUrl = '';
  String res = "";
  String profilePho = "";
  String temp = "";
  bool _isLoading = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    // getData();
  }

  // updateProfilePhoto() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String result = await FireAuth()
  //       .updateCred(oldCred: 'profilePhotoUrl', newCred: profilePho);
  //   try {
  //     if (result != 'success') {
  //       falseSnackBar(context, result, widget);
  //       showAlertDialog(
  //           context,
  //           "Error!",
  //           result,
  //           Icon(
  //             Icons.error,
  //             color: Colors.red,
  //           ));
  //     } else {
  //       setState(() {
  //         res = "success";
  //       });
  //       showAlertDialog(
  //           context,
  //           "",
  //           "Success",
  //           Icon(
  //             Icons.check,
  //             color: Colors.green,
  //           ));
  //       navigatePop(context, widget);
  //       trueSnackBar(context, widget);
  //     }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     falseSnackBar(context, e.toString(), widget);
  //   }
  // }
  // setProfilePhoto() async {
  //   try {
  //
  //       profilePho = await storageMeth()
  //           .uploadImageFileToFirebaseStorage(
  //           'profilePics', _image!, false);
  //
  //
  //     }catch(e){
  //     print(e);
  //   }
  // }

  void selectFile() async {
    Uint8List Photo = await selectImage(ImageSource.gallery);
    setState(() {
      _image = Photo;
    });
  }

  // getProfilePhoto() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //
  //   setState(() {
  //     profilePhotoUrl =
  //         (snap.data() as Map<String, dynamic>)['profilePhotoUrl'];
  //   });
  //   print(profilePhotoUrl);
  // }

  final List<CategoryTag> _category = <CategoryTag>[];
  List<String> tagss = [];
  List? tagss1;

  var userData = {};

  updateData(OLD, NEW) async {
    try {
      var up = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({OLD: NEW});
      ;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = snap.data()!;
      tagss1 = userData['skills'];
      _aboutMe.text = userData['bio'];

      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Widget build(BuildContext context) {
    // if(_category.length<=5){
    //   for(int i = 0; i<tagss1!.length;i++){
    //     _category.add(CategoryTag(tagss1!.elementAt(i)));
    //   }
    // }

    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              try {
                setState(() {
                  _isLoading = true;
                });
                photoUrl = _image == null
                    ? await userData['profilePhotoUrl']
                    : await storageMeth().uploadImageFileToFirebaseStorage(
                        'profilePics', _image!, false);
                updateData('skills', tagss1);

                updateData('bio', _aboutMe.text);
                updateData('profilePhotoUrl', photoUrl);

                setState(() {
                  _isLoading = false;
                });
                navigateToWithoutBack(
                    context, userSettings(isAfterChange: true));
              } catch (e) {
                showSnackBar(context, e.toString());
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: Container(
              margin: EdgeInsets.all(8),
              width: 120,
              decoration: BoxDecoration(
                  color: offersColor, borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: primaryColor,
                          )
                        : Text(
                            'Save',
                            style:
                                TextStyle(color: primaryColor, fontSize: 25.0),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: primaryColor,
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Change Profile Picture",
                  style: TextStyle(
                      color: secColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(90)),
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: _image == null
                            ? Image.network(
                                userData['profilePhotoUrl'],
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: -10,
                        left: 70,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                selectFile();
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
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Change Skills",
                  style: TextStyle(
                      color: secColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: offersColor)),
                          child: TextField(
                            controller: _controller,
                            cursorColor: offersColor,
                            decoration: InputDecoration(
                                focusColor: offersColor,
                                hoverColor: offersColor,
                                border: InputBorder.none),
                            onChanged: (value) {
                              setState(() {
                                temp = value;
                              });
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (tagss1!.length == 5) {
                              setState(() {
                                showAlertDialog(
                                    context,
                                    "",
                                    "Cannot add more than 5 Category tags !",
                                    Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ));
                              });
                            } else {
                              setState(() {
                                tagss1!.add(_controller.text);
                                _controller.clear();
                              });
                            }
                            print(_category.length);
                          },
                          child: Text("Add"),
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(), primary: offersColor),
                        ),
                        Container(
                            margin: EdgeInsets.all(2),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Example: Programming or Python',
                              style: TextStyle(color: Colors.grey.shade500),
                            )),
                      ],
                    ),
                    Wrap(spacing: 25,
                        // children: actorWidgets.toList(),
                        children: [
                          for (var i in tagss1!)
                            (Chip(
                              label: Text(i.toString()),
                              onDeleted: () {
                                setState(() {
                                  tagss1!.removeWhere((element) =>
                                      element.toString() == i.toString());
                                });
                              },
                              backgroundColor: Colors.grey.shade200,
                              deleteIconColor: Colors.grey,
                            ))
                        ])
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: Text(
                  "About me",
                  style: TextStyle(
                      color: secColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              TextField(
                  controller: _aboutMe,
                  onChanged: (value) {
                    setState(() {});
                  },
                  cursorColor: offersColor,
                  maxLines: 50,
                  minLines: 5,
                  maxLength: 400,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: offersColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  )),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Dialog errorDialog(
//     context,
//     widget,
//     TextEditingController skill1,
//     TextEditingController skill2,
//     TextEditingController skill3,
//     TextEditingController skill4,
//     TextEditingController skill5) {
//   return Dialog(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//     //this right here
//     child: ListView(
//       children: [
//         Padding(
//           child: Container(
//             height: 450.0,
//             width: 300.0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Skill 1',
//                   style: TextStyle(color: secColor),
//                 ),
//                 TextFieldInput(
//                     textEditingController: skill1,
//                     hintText: "Please enter skill 1",
//                     textInputType: TextInputType.text),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Skill 2',
//                   style: TextStyle(color: secColor),
//                 ),
//                 TextFieldInput(
//                     textEditingController: skill2,
//                     hintText: "Please enter skill 2",
//                     textInputType: TextInputType.text),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Skill 3',
//                   style: TextStyle(color: secColor),
//                 ),
//                 TextFieldInput(
//                     textEditingController: skill3,
//                     hintText: "Please enter skill 3",
//                     textInputType: TextInputType.text),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Skill 4',
//                   style: TextStyle(color: secColor),
//                 ),
//                 TextFieldInput(
//                     textEditingController: skill4,
//                     hintText: "Please enter skill 4",
//                     textInputType: TextInputType.text),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Skill 5',
//                   style: TextStyle(color: secColor),
//                 ),
//                 TextFieldInput(
//                     textEditingController: skill5,
//                     hintText: "Please enter skill 5",
//                     textInputType: TextInputType.text),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(padding: EdgeInsets.only(top: 10.0)),
//                 TextButton(
//                     onPressed: () {
//                       navigatePop(context, widget);
//                     },
//                     child: Text(
//                       'Save Changes',
//                       style: TextStyle(color: Colors.green, fontSize: 18.0),
//                     ))
//               ],
//             ),
//           ),
//           padding: EdgeInsets.all(20),
//         )
//       ],
//     ),
//   );
// }
}
