import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/Services/dataSearch.dart';
import 'package:zone/additional/colors.dart';

import 'addOfferMain/mainOfferCard.dart';

class personalOffersScreen extends StatefulWidget {
  const personalOffersScreen({Key? key, bool isUploaded = false})
      : super(key: key);

  @override
  State<personalOffersScreen> createState() => _personalOffersScreenState();
}

class _personalOffersScreenState extends State<personalOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            //TODO: #######################
            //TODO: >>>>> Fombad here <<<<<
            //TODO: #######################
          },
          child: Icon(Icons.search),
        ),
        centerTitle: true,
        title: Expanded(
            child: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        )),
        backgroundColor: offersColor,
        elevation: 0,
        actions: [
          //balance
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                          child: Icon(
                        Icons.monetization_on,
                        color: offersColor,
                        size: 30,
                      )),
                      FittedBox(
                        child: Text(
                          "  0.0 ",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: offersColor,
                              fontSize: 30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Category').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Expanded(
                child: GridView(
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 210,
              ),
              children:
                  List<Widget>.generate(snapshot.data!.docs.length, (index) {
                        return Container(
                            child: MainOfferCard(
                                snap: snapshot.data!.docs[index].data()));
                      }) +
                      [
                        Center(
                            child: Wrap(
                          children: [
                            Text('You have reached the end. ',
                                style: TextStyle(fontSize: 14)),
                            Icon(
                              Icons.check_circle,
                              color: offersColor,
                            )
                          ],
                        ))

                ] + [Container(height: 1,)],
            ));
          },
        ),
      ),
    );
  }
}
