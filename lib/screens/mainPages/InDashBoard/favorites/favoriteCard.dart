import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/editOfferMain/editOffer/editOfferScreen.dart';
import 'package:zone/screens/mainPages/offerProfile.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class favoriteCard extends StatefulWidget {
  final offerId;
  final isLocal;

  const favoriteCard({Key? key, required this.offerId, required this.isLocal})
      : super(key: key);

  @override
  State<favoriteCard> createState() => _favoriteCardState();
}

class _favoriteCardState extends State<favoriteCard> {
  var snap = {};

  getData() async {
    try {
      var snap4 = await FirebaseFirestore.instance
          .collection('Category')
          .doc(widget.offerId)
          .get();

      snap = snap4.data()!;
      setState(() {});
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            offerProfile(
              uid: snap['offerId'],
              ownerUid: snap['uid'],
            ));
      },
      child: Container(
        child: Wrap(spacing: 0, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              snap['PhotoUrl'] != null
                  ? Container(
                      child: ClipRect(
                      child: Container(
                        height: 150,
                        width: 100,
                        child: CachedNetworkImage(
                          imageUrl: snap['PhotoUrl'],
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            color: Colors.grey.shade300,
                            height: 150,
                            width: 100,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Icon(Icons.image), Text('image')],
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ))
                  : Container(
                      color: Colors.grey.shade300,
                      height: 150,
                      width: 100,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.image), Text('image')],
                        ),
                      ),
                    )
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: offersColor),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 29,
                    child: Text(
                      'I will ${snap['title']}',
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: primaryColor),
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    color: primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                        child: Text(
                          "${snap['price']} \$",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: offersColor,
                              fontSize: 25),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          rating(double.parse(snap!['rating']), true, 11.5)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.adaptive.share,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.plus_app,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          widget.isLocal
              ? InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        editOfferScreen(
                          offerId: snap['offerId'],
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    padding: EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      'Edit',
                      style: TextStyle(fontSize: 20, color: primaryColor),
                    )),
                  ),
                )
              : Container(),
          Container(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
