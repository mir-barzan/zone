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
  final String offerUrl;
  final datePublished;
  final String timeNeeded;
  final String price;
  final String offerId;

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
      required this.offerUrl,
      required this.datePublished,
      required this.timeNeeded,
      required this.price, required this.offerId});

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
        "offerUrl": offerUrl,
        "datePublished": datePublished,
        "timeNeeded": timeNeeded,
        "price": price,
    "offerId":offerId
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
        offerUrl: snapshot['offerUrl'],
        datePublished: snapshot['datePublished'],
        timeNeeded: snapshot['timeNeeded'],
        price: snapshot['price'],
        offerId: snapshot['offerId']);
  }
}
