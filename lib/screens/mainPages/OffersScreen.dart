import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/Services/dataSearch.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/offerProfile.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import 'addOfferMain/mainOfferCard.dart';

class personalOffersScreen extends StatefulWidget {
  const personalOffersScreen({Key? key, bool isUploaded = false})
      : super(key: key);

  @override
  State<personalOffersScreen> createState() => _personalOffersScreenState();
}

class _personalOffersScreenState extends State<personalOffersScreen> {
  void initState() {
    super.initState();

    // getData();
  }

  TextEditingController searchControlling = new TextEditingController();
  bool isShowing = false;
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: offersColor,
        toolbarHeight:
            MediaQuery.of(context).size.height * 0.175, //set your height
        flexibleSpace: SafeArea(
          child: Container(
            color: offersColor, // set your color
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/zoneLogo.svg',
                        color: primaryColor,
                        width: 180,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Form(
                          child: TextFormField(
                            controller: searchControlling,
                            onChanged: (value) {
                              setState(() {
                                isShowing = true;
                              });
                              if (searchControlling.text.isEmpty) {
                                setState(() {
                                  isShowing = false;
                                });
                              }
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Search for an offer'),
                            onFieldSubmitted: (String _) {
                              setState(() {
                                isShowing = true;
                                searchKey = searchControlling
                                    .text.characters.first
                                    .toString()
                                    .toLowerCase();
                              });
                              print(_);
                            },
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_alt,
                            color: primaryColor,
                          ))
                    ],
                  ),
                  Container(
                    height: 2,
                  ) // set an icon or image
                  // set your search bar setting
                ],
              ),
            ),
          ),
        ),
      ),
      body: isShowing
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('Category')
                  .where('searchKeys', arrayContains: searchControlling.text)
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: offersColor,
                    ),
                  );
                }
                return ListView.builder(
                  controller: ScrollController(),
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => offerProfile(
                            uid: (snapshot.data! as dynamic).docs[index]
                                ['offerId'],
                            ownerUid: (snapshot.data! as dynamic).docs[index]
                                ['uid'],
                          ),
                            ),
                          ),
                      child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: offersColor, width: 3)),
                          child: Stack(
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      (snapshot.data! as dynamic).docs[index]
                                      ['title'],
                                    ),
                                    rating(
                                        (snapshot.data! as dynamic).docs[index]
                                        ['rating'],
                                        true,
                                        20)
                                  ],
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: offersColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40))),
                                  child: Text(
                                    '\$ ${(snapshot.data! as dynamic).docs[index]['price']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor,
                                        fontSize: 25),
                                  ),
                                ),
                              ),
                              Icon(Icons.local_offer_outlined)
                            ],
                          )),
                    );
                  },
                );
              },
            )
          : SafeArea(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Category')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Expanded(
                      child: GridView(
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: kIsWeb ? 4 : 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 210,
                    ),
                    children: List<Widget>.generate(snapshot.data!.docs.length,
                            (index) {
                          return Container(
                              child: MainOfferCard(
                            snap: snapshot.data!.docs[index].data(),
                            isLocal: false,
                          ));
                        }) +
                        [
                          Center(
                              child: Wrap(
                            children: [
                              Text(' ', style: TextStyle(fontSize: 14)),
                            ],
                          ))
                        ] +
                        [
                          Container(
                            height: 1,
                          )
                        ],
                  ));
                },
              ),
            ),
    );
  }
}

class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('Category')
        .where(
          'searchKeys',
          arrayContains: searchField.substring(0, 1).toUpperCase(),
        )
        .get();
  }
}