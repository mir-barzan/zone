import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Offer {
  final String title;
  final String fname;
  final String lname;
  final String username;
  final String uid;
  final String description;
  final String rating;
  final String rank;
  final String PhotoUrl;
  final datePublished;
  final String timeNeeded;
  final String price;
  final String offerId;
  final categoryTags;
  final faqQuestion;
  final faqAnswer;
  final searchKeys;

  const Offer(
      {required this.title,
      required this.fname,
      required this.lname,
      required this.username,
      required this.uid,
      required this.description,
      required this.rating,
      required this.rank,
      required this.PhotoUrl,
      required this.datePublished,
      required this.timeNeeded,
      required this.price,
      required this.offerId,
      required this.categoryTags,
      required this.faqQuestion,
      required this.faqAnswer,
      required this.searchKeys});

  Map<String, dynamic> toJson() => {
        "title": title,
        "fname": fname,
        "lname": lname,
        "username": username,
        "uid": uid,
        "description": description,
        "rating": rating,
        "rank": rank,
        "PhotoUrl": PhotoUrl,
        "datePublished": datePublished,
        "timeNeeded": timeNeeded,
        "price": price,
        "offerId": offerId,
        "categoryTags": categoryTags,
        "faqQuestion": faqQuestion,
        "faqAnswer": faqAnswer,
        "searchKeys": searchKeys
      };

  static Offer fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Offer(
        title: snapshot['title'],
        fname: snapshot['fname'],
        lname: snapshot['lname'],
        username: snapshot['username'],
        uid: snapshot['uid'],
        description: snapshot['description'],
        rating: snapshot['rating'],
        rank: snapshot['rank'],
        PhotoUrl: snapshot['PhotoUrl'],
        datePublished: snapshot['datePublished'],
        timeNeeded: snapshot['timeNeeded'],
        price: snapshot['price'],
        offerId: snapshot['offerId'],
        categoryTags: snapshot['categoryTags'],
        faqQuestion: snapshot['faqQuestion'],
        faqAnswer: snapshot['faqAnswer'],
        searchKeys: snapshot['searchKeys']);
  }
}
