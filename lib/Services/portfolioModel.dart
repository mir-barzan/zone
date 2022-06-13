import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Portfolio {
  final String title;
  final String fname;
  final String lname;
  final String uid;
  final String description;
  final imageList;

  final datePublished;

  final String portfolioId;

  const Portfolio(
      {required this.title,
      required this.fname,
      required this.lname,
      required this.uid,
      required this.portfolioId,
      required this.description,
      required this.imageList,
      required this.datePublished});

  Map<String, dynamic> toJson() => {
        "title": title,
        "fname": fname,
        "lname": lname,
        "uid": uid,
        "description": description,
        "imageList": imageList,
        "datePublished": datePublished,
        "portfolioId": portfolioId,
      };

  static Portfolio fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Portfolio(
      title: snapshot['title'],
      fname: snapshot['fname'],
      lname: snapshot['lname'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      imageList: snapshot['imageList'],
      datePublished: snapshot['datePublished'],
      portfolioId: snapshot['portfolioId'],
    );
  }
}
