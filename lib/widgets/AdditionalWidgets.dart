import 'package:flutter/material.dart';

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

showAlertDialog(BuildContext context, String errorText,String text, Icon icon) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {  Navigator.of(context).pop();},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(errorText),
    content: Container(
      child: Row(
        children: [
          icon,
      Flexible(
        child: Text(text,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      )],
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
Widget ccontainer(String text){
  return Container(
    child: Center(child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
    decoration: BoxDecoration(
      color: secColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(42),
          topRight: Radius.circular(42),
          bottomLeft: Radius.circular(42),
          bottomRight: Radius.circular(42)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}