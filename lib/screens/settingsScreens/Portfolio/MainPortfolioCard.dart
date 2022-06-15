import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/offerProfile.dart';
import 'package:zone/screens/settingsScreens/Portfolio/portfolioProfile.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class MainPortfolioCard extends StatefulWidget {
  final snap;
  final isLocal;

  const MainPortfolioCard({Key? key, required this.snap, required this.isLocal})
      : super(key: key);

  @override
  State<MainPortfolioCard> createState() => _MainPortfolioCardState();
}

class _MainPortfolioCardState extends State<MainPortfolioCard> {
  var portfolio = {};
  bool isLoading = false;

  deletePortfolio() async {
    try {
      setState(() {
        isLoading = true;
      });
    } catch (e) {
      showSnackBar(context, e.toString());
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List imageList = widget.snap['imageList'];

    return widget.isLocal
        ? GestureDetector(
            onTap: () {
              navigateTo(
                  context,
                  porfolioProfile(
                    porfolioId: widget.snap['portfolioId'],
                  ));
            },
            child: Container(
              child: Wrap(spacing: 0, children: [
                Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      imageList.isNotEmpty
                          ? Container(
                              child: ClipRect(
                              child: Container(
                                height: 150,
                                width: 100,
                                child: CachedNetworkImage(
                                  imageUrl: imageList.first,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.teal, width: 2),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image),
                                          Text('image')
                                        ],
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ))
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border:
                                    Border.all(color: Colors.teal, width: 2),
                              ),
                              height: 150,
                              width: 100,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image),
                                    Text('no image')
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.red),
                    padding: EdgeInsets.all(8),
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: primaryColor,
                          )
                        : GestureDetector(
                            child: Icon(Icons.delete, color: Colors.white),
                            onTap: () {
                              setState(() {
                                isLoading = true;
                              });

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(''),
                                  content: const Text(
                                      "Are you sure you want to Delete this?"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("Portfolio")
                                            .doc(widget.snap['portfolioId'])
                                            .delete();
                                        for (int i = 0;
                                            i < imageList.length;
                                            i++) {
                                          FirebaseStorage.instance
                                              .refFromURL(
                                                  imageList.elementAt(i))
                                              .delete();
                                        }
                                        Navigator.pop(context, 'OK');
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Colors.teal),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
                    child: Column(
                      children: [
                        Container(
                          height: 29,
                          child: Text(
                            '${widget.snap['title']}',
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: primaryColor),
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 1,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              DateFormat.yMMMd().format(
                                  widget.snap['datePublished'].toDate()),
                              style: TextStyle(color: primaryColor),
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
                Container(
                  height: 10,
                ),
              ]),
            ),
          )
        : GestureDetector(
            onTap: () {
              navigateTo(
                  context,
                  porfolioProfile(
                    porfolioId: widget.snap['portfolioId'],
                  ));
            },
            child: Container(
              child: Wrap(spacing: 0, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    imageList.isNotEmpty
                        ? Container(
                            child: ClipRect(
                            child: Container(
                              height: 150,
                              width: 100,
                              child: CachedNetworkImage(
                                imageUrl: imageList.first,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.teal, width: 2),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image),
                                        Text('image')
                                      ],
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ))
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.all(color: Colors.teal, width: 2),
                            ),
                            height: 150,
                            width: 100,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Icon(Icons.image), Text('no image')],
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
                      color: Colors.teal),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
                    child: Column(
                      children: [
                        Container(
                          height: 29,
                          child: Text(
                            '${widget.snap['title']}',
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: primaryColor),
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 1,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              DateFormat.yMMMd().format(
                                  widget.snap['datePublished'].toDate()),
                              style: TextStyle(color: primaryColor),
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
                Container(
                  height: 10,
                ),
              ]),
            ),
          );
  }
}
