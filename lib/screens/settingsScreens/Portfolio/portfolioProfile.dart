import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class porfolioProfile extends StatefulWidget {
  final porfolioId;

  const porfolioProfile({Key? key, required this.porfolioId}) : super(key: key);

  @override
  State<porfolioProfile> createState() => _porfolioProfileState();
}

class _porfolioProfileState extends State<porfolioProfile> {
  var portData = {};
  var userData = {};
  List imageList = [];
  int index = 0;

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('Portfolio')
          .doc(widget.porfolioId)
          .get();

      portData = snap.data()!;
      imageList = await portData['imageList'];

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
        title: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        ),
        backgroundColor: offersColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    if (index > 0 && index < imageList.length) {
                      setState(() {
                        index -= 1;
                      });
                    }
                  },
                ),
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: offersColor, width: 3)),
                              height: 200,
                              width: double.infinity,
                              child: imageList.isNotEmpty
                                  ? Image.network(
                                      imageList.elementAt(index),
                                      fit: BoxFit.cover,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image),
                                        Text('no images')
                                      ],
                                    )),
                        ]),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    if (index < imageList.length - 1) {
                      setState(() {
                        index += 1;
                      });
                    }
                  },
                )
              ],
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${portData['title']}',
                maxLines: 2,
                style: TextStyle(fontSize: 25, color: offersColor),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Details:',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 27,
                      color: offersColor,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timer_outlined, color: primaryColor),
                      Container(
                        width: 5,
                      ),
                      Text(
                        'Posted on  ${DateFormat.yMMMd().format(portData['datePublished'].toDate())}',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: offersColor,
                      borderRadius: BorderRadius.circular(30)),
                )
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${portData['description']}',
                  maxLines: 50,
                  style: TextStyle(fontSize: 20, color: offersColor),
                ),
              ),
            ),
            Container(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
