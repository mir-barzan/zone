import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zone/widgets/text_field_input.dart';
import '../additional/colors.dart';
import 'package:image_picker/image_picker.dart';
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

trueSnackBar(BuildContext context, Widget widget) {
  return ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Icon(
        Icons.check,
        color: Colors.green,
      ),
    ),
  );
}

falseSnackBar(BuildContext context, String text, Widget widget) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Column(
      children: [
        Text(text),
        const Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      ],
    )),
  );
}

navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

navigatePop(BuildContext context, Widget widget) {
  Navigator.of(context).pop();
}

navigateToWithoutBack(BuildContext context, Widget widget) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => widget));
}

showAlertDialog(
    BuildContext context, String errorText, String text, Icon icon) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(errorText),
    content: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          icon,
          Flexible(
            child: Text(
              text,
            ),
          )
        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget ccontainer(String text) {
  return Container(
    child: Center(
        child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )),
    decoration: BoxDecoration(
      color: secColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(42),
          topRight: Radius.circular(42),
          bottomLeft: Radius.circular(42),
          bottomRight: Radius.circular(42)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
    width: 30,
    height: 30,
  );
}

settingButton(String text, IconData icon, BuildContext context, Widget widget) {
  return FlatButton(
      height: 25.0,
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
          height: 50.0,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    icon,
                    color: secColor,
                  ),
                  Expanded(
                      child: Container(
                          child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: secColor, fontWeight: FontWeight.bold),
                    ),
                  )))
                ],
              )),
            ],
          )));
}

// settingsDialog(
//     BuildContext context, String errorText, String text, Icon icon) {
//   // set up the button
//   Widget okButton = TextButton(
//     child: Text("Confirm"),
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(errorText),
//     content: Container(
//       child: Row(
//         children: [
//           icon,
//           Flexible(
//             child: Text(
//               text,
//               maxLines: 1,
//               softWrap: false,
//               overflow: TextOverflow.fade,
//             ),
//           )
//         ],
//       ),
//     ),
//     actions: [
//       okButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
//TODO: complete here below
// showDialogSubScreen(BuildContext context){
//   TextEditingController _emailController = new TextEditingController();
//   showDialog(context: context, builder: BuildContext context)
// }

settingButton2(
    String labelText, String dataText, BuildContext context, Widget widget) {
//TODO connect data with firebase!!(for example: show the current username before changing it like Facebook)
  return FlatButton(
      height: 25.0,
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
          height: 50.0,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                          child: Center(
                              child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            labelText,
                            style: TextStyle(
                                color: secColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  )))),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: secColor,
                  ),
                ],
              )),
            ],
          )));
}

whiteTextInDark(String label, double fontSize) {
  return Text(label, style: TextStyle(color: primaryColor, fontSize: fontSize));
}

checker(String username, Widget widget) {
  if (username.length >= 1) {
    return widget;
  } else if (username.length < 1) {
    return CircularProgressIndicator.adaptive();
  } else {
    return Text('Error');
  }
}

rating(double Rating, bool ignoreTabs, double size) {
  return RatingBar.builder(
    itemSize: size,
    ignoreGestures: ignoreTabs,
    glow: true,
    initialRating: Rating,
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      print(rating);
    },
  );
}

rating2(x, bool ignoreTabs, double size) {
  return RatingBar.builder(
    itemSize: size,
    ignoreGestures: ignoreTabs,
    glow: true,
    initialRating: 0,
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {},
  );
}

roundedContainerWithBackground(String label, Color backgroundColor,
    [double radius = 45]) {
  return Container(
    margin: EdgeInsets.all(2),
    padding: const EdgeInsets.all(5),
    child: FittedBox(
      child: Text(
        label,
        style: TextStyle(
            color: primaryColor, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: backgroundColor),
    ),
  );
}

portfolioContainer(String label, String imageLink) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: offersColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: offersColor, width: 3),
            image: DecorationImage(
                image: NetworkImage(imageLink), fit: BoxFit.cover)),
      ),
      SizedBox(
        height: 5,
      ),
      FittedBox(
        child: Text(label,
            style: TextStyle(color: secColor, fontSize: 13,fontWeight: FontWeight.bold, letterSpacing: 1)),
      )
    ],
  );
}

hireButton(String label, Color backgroundColor, IconData icon, Color iconColor,
    [double radius = 45]) {
  return FittedBox(
    child: Container(
      margin: EdgeInsets.all(2),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                label,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              icon,
              color: iconColor,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: backgroundColor),
      ),
    ),
  );
}





errorOrSuccess(String result) {
  if (result == "success") {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Row(
              children: [
                Text("Success"),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                )
              ],
            ),
            height: 300.0,
            width: 300.0,
          )),
    );
  } else{
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Row(
              children: [
                Text("Error"),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.error_outlined,
                  color: Colors.red,
                )
              ],
            ),
            height: 300.0,
            width: 300.0,
          )),
    );
  }
}
selectImage(ImageSource source)async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if(_file != null){
    return _file.readAsBytes();
  }
  print('no file selected');
}

DetailsInformation(String label) {
  return Wrap(
    children: [
      Container(
        height: 5,
      ),
      Center(
        child: Icon(
          Icons.info_outline,
          color: Colors.grey,
        ),
      ),
      Center(
        child: Text(
          "  $label.",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ),
      Container(
        height: 5,
      ),
    ],
  );
}

moneyString(x){
  return x.toString();
}

Widget badge(String assetName, double width, double height, bool active) {
  return Container(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: width - 12,
            height: height - 12,
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(90),
            )),
        SvgPicture.asset(
          'assets/images/$assetName',
          width: width,
          height: height,
          color: active ? null : Colors.grey,
        )
      ],
    ),
  );
}

Widget AllBadges(
    bool isZoner, bool isVerified, bool isPro, bool isGold, bool isStar) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    badge("welcome.svg", 60, 60, isZoner),
    badge("verified.svg", 60, 60, isVerified),
    badge("pro.svg", 60, 60, isPro),
    badge("gold.svg", 60, 60, isGold),
    badge("star.svg", 60, 60, isStar),
  ]);
}

Widget Ratingbadge(String rating, double width, double height) {
  return Container(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: width - 30,
            height: height - 30,
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.fromBorderSide(BorderSide(color: primaryColor)),
            )),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text('$rating/5')
          ],
        )
      ],
    ),
  );
}

Widget RatingbadgeUp(String rating, double width, double height) {
  return Container(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: width - 22,
            height: height - 25,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90), topRight: Radius.circular(90)),
              border: Border.all(color: offersColor, width: 3),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text('$rating/5')
          ],
        )
      ],
    ),
  );
}
