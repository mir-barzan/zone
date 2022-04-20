import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../additional/colors.dart';

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
      child: Row(
        children: [
          icon,
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
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
          child: Expanded(
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
                  style:
                      TextStyle(color: secColor, fontWeight: FontWeight.bold),
                ),
              )))
            ],
          ))));
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
          child: Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        style:
                        TextStyle(color: secColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dataText,
                          style:
                          TextStyle(color: secColor, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  )
                ],
              )))),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                color: secColor,
              ),
            ],
          ))));
}
