import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zone/Services/FireStoreSettings.dart';
import 'package:zone/Services/storageSettings.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/settingsScreens/Portfolio/portfolioScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class addNewPortfolio extends StatefulWidget {
  const addNewPortfolio({Key? key}) : super(key: key);

  @override
  State<addNewPortfolio> createState() => _addNewPortfolioState();
}

class _addNewPortfolioState extends State<addNewPortfolio> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  final multiPicker = ImagePicker();
  List<XFile>? images = [];
  List<Uint8List>? imagesAsBytes = [];
  bool _isLoading = false;
  List uploadedPhotosUrl = [];
  String uid = '';
  String fname = '';
  String lname = '';
  var userData = {};

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = snap.data()!;
      fname = userData['fname'];
      uid = userData['uid'];
      lname = userData['lname'];
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                List<File> c = [];
                for (int i = 0; i < images!.length; i++) {
                  c.add(File(images![i].path));
                }
                for (int i = 0; i < c.length; i++) {
                  imagesAsBytes!.add(await c[i].readAsBytes());
                }
                for (int i = 0; i < imagesAsBytes!.length; i++) {
                  uploadedPhotosUrl.add(await storageMeth()
                      .uploadImageFileToFirebaseStorage(
                          'Portfolios', imagesAsBytes![i], true));
                }
                String x = await FireStoreSettings().uploadPortfolio(
                    uploadedPhotosUrl,
                    _titleController.text,
                    _descriptionController.text,
                    uid,
                    fname,
                    lname);
                setState(() {
                  print(x.toString());
                  _isLoading = false;
                });
                navigateToWithoutBack(
                    context,
                    portfolioScreen(
                      isAfterAddingANewPortfolio: true,
                    ));
              } catch (e) {
                Fluttertoast.showToast(msg: e.toString());
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: Container(
              margin: EdgeInsets.all(8),
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
                            'Post New Portfolio',
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
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        ),
        backgroundColor: offersColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: offersColor, width: 2),
                  borderRadius: BorderRadius.circular(5)),
              child: Wrap(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            controller: _titleController,
                            cursorColor: offersColor,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Your Portfolio Title",
                              labelStyle: TextStyle(color: offersColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: offersColor, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            ),
                            maxLength: 30,
                            style: TextStyle(fontSize: 18),
                          ),
                          width: 120,
                          height: 80,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: TextField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            cursorColor: offersColor,
                            maxLines: 50,
                            controller: _descriptionController,
                            minLines: 5,
                            maxLength: 250,
                            decoration: InputDecoration(
                              labelText: "Your Portfolio Description",
                              labelStyle: TextStyle(color: offersColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: offersColor, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            )),
                        width: double.infinity,
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          FittedBox(
                            child: GestureDetector(
                              onTap: () {
                                selectPortfolioImages();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Choose Images",
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    Icon(
                                      Icons.image,
                                      color: primaryColor,
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 80,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3),
                        itemBuilder: (context, index) => images!.isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  selectPortfolioImages();
                                },
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  child: images!.isEmpty
                                      ? Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                          size: 30,
                                        )
                                      : Image.file(
                                          File(images![index].path),
                                          fit: BoxFit.cover,
                                        ),
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      border: Border.all(color: Colors.grey)),
                                ),
                              )
                            : Stack(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 200,
                                    child: images!.isEmpty
                                        ? Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                            size: 30,
                                          )
                                        : Image.file(
                                            File(images![index].path),
                                            fit: BoxFit.cover,
                                          ),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          images!.removeWhere((element) =>
                                              element.path ==
                                              images![index].path);
                                        });
                                        print('Tapped');
                                      },
                                      child: Icon(Icons.cancel))
                                ],
                              ),
                        itemCount: images!.isEmpty ? 3 : images!.length,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectPortfolioImages() async {
    final List<XFile>? selectedPictures = await multiPicker.pickMultiImage();
    setState(() {
      if (selectedPictures!.isNotEmpty) {
        images!.addAll(selectedPictures);
      } else {
        print("The user didn't select any image");
      }
    });
  }
}
