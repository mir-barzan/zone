import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zone/additional/colors.dart';

import 'package:zone/widgets/AdditionalWidgets.dart';
import './editreviewAndSubmit.dart';

class editimageAndConfigureScreen extends StatefulWidget {
  final offerId;

  const editimageAndConfigureScreen({Key? key, required this.offerId})
      : super(key: key);

  @override
  State<editimageAndConfigureScreen> createState() =>
      _editimageAndConfigureScreenState();
}

class _editimageAndConfigureScreenState
    extends State<editimageAndConfigureScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Uint8List? _image;
  var offerData = {};
  String imageUrl = "";

  getData() async {
    var snap = await FirebaseFirestore.instance
        .collection('Category')
        .doc(widget.offerId)
        .get();
    offerData = snap.data()!;

    print(imageUrl);
    setState(() {
      imageUrl = offerData['PhotoUrl'].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DetailsInformation(
                "Choosing the right photo will reflex your Offer cover book. Also, please make sure that the image you are selecting is well showing what you offer"),
            Container(
              height: 15,
            ),
            Center(
              child: Text(
                "Please choose your Offer image",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: _image != null
                    ? Container(
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              alignment: Alignment.center,
                              image: MemoryImage(_image!),
                              width: double.infinity,
                              height: 220,
                              fit: BoxFit.cover,
                            )),
                      )
                    : Container(
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl.toString(),
                              fit: BoxFit.cover,
                            )),
                      )),
            Container(
              height: 20,
            ),
            Container(
              height: 50,
              width: 220,
              child: ElevatedButton(
                onPressed: () {
                  selectFile();
                  setState(() {
                    editreviewAndSubmit.newImage.value = _image!;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_sharp,
                      size: 30,
                    ),
                    Text('Change Image')
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: offersColor),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void selectFile() async {
    Uint8List Photo = await selectImage(ImageSource.gallery);
    setState(() {
      _image = Photo;
      editreviewAndSubmit.newImage.value = _image!;
    });
  }
}
