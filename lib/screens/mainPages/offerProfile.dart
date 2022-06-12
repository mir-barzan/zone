import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';

class offerProfile extends StatefulWidget {
  final String uid;

  const offerProfile({Key? key, required this.uid}) : super(key: key);

  @override
  State<offerProfile> createState() => _offerProfileState();
}

class _offerProfileState extends State<offerProfile> {
  String username = "";

  var userData = {};

  void initState() {
    super.initState();
    getData();
    // getData();
  }

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Category')
          .doc(widget.uid)
          .get();
      userData = snap.data()!;
      username = userData['username'];
      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Expanded(
            child: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        )),
        backgroundColor: offersColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              child: Image.network(
                userData['PhotoUrl'],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                userData['title'],
                maxLines: 2,
                style: TextStyle(fontSize: 25, color: offersColor),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //here is the badges
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: offersColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Text(
                    "${userData['price']} \$",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                        fontSize: 30),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
