import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zone/additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';

class DataSearch extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('category');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element["categoryTags"]
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Text("no job found! try using another name for job"),
              );
            } else {
              return ListView(children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element["categoryTags"]
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map((QueryDocumentSnapshot<Object?> data) {
                  final String worker = data.get("username");
                  final String rank = data.get("rank");
                  final String rating = data.get("rating");
                  final String id = data.get("id");
                  final String image = data.get("profilePhotoUrl");
                  return ListTile(
                    onTap: () {},
                    title: Text(worker),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(image),
                    ),
                    subtitle: Text(rating),
                  );
                })
              ]);
            }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("search for offers here "));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }
}
