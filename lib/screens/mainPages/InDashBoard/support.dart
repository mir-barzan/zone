import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zone/additional/colors.dart';

class support extends StatefulWidget {
  const support({Key? key}) : super(key: key);

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        ),
        backgroundColor: offersColor,
        elevation: 0,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        child: Text(
                      'Request a support',
                      style: TextStyle(color: offersColor),
                    ))),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                  cursorColor: offersColor,
                  maxLines: 500,
                  minLines: 5,
                  maxLength: 1500,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: offersColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  )),
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                      child: Text(
                    'Send',
                    style: TextStyle(color: primaryColor),
                  )),
                  decoration: BoxDecoration(
                      color: offersColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Expanded(child: Container()),
              ],
            ),
            Divider(
              thickness: 2,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        child: Text(
                      'Or contact us on email\n\nsupport@appers.org',
                      style: TextStyle(color: offersColor),
                    ))),
              ],
            ),
            Divider(
              thickness: 2,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        child: Text(
                      'Current requests: 0',
                      style: TextStyle(color: offersColor),
                    ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
