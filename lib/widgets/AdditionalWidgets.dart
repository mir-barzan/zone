import 'package:flutter/material.dart';

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
