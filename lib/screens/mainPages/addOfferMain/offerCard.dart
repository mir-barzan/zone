import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/addOfferMain/information.dart';

class OfferCard {
  String title;
  String price;
  String rate;
  Uint8List? image;

  OfferCard(
      {required this.title, this.price = "0", this.rate = '0', this.image});

  makeCard() {
    return Container(

      child: Wrap(spacing: 0, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            image!.isNotEmpty
                ? Container(
                    child: ClipRect(
                        child: Image(
                    alignment: Alignment.center,
                    image: MemoryImage(image!),
                    width: 300,
                    height: 220,
                    fit: BoxFit.cover,
                  )))
                : Container(
                    color: Colors.grey.shade300,
                    height: 219,
                    width: 300,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image),Text('Your image here')
                        ],
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
                  child: Text(
                    'I will $title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: primaryColor),
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: primaryColor,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Text(
                        "${price.toString()} \$",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: offersColor,
                            fontSize: 25),
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          "(${rate})",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                              fontSize: 15),
                        ),
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
                        Text(
                          "Share",
                          style: TextStyle(fontSize: 18, color: primaryColor),
                        )
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
                        Text(
                          "Add to favorites",
                          style: TextStyle(fontSize: 18, color: primaryColor),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

getInPref(key, title) async {
  await sharedprefs.setData(key, title);
}
