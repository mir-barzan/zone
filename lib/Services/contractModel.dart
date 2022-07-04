import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contract {
  final String contractId;
  final String buyerId;
  final String sellerId;
  final startingDate;
  final endingDate;
  final amount;
  final totalTime;
  final offerId;

  const Contract({
    required this.contractId,
    required this.buyerId,
    required this.sellerId,
    required this.startingDate,
    required this.endingDate,
    required this.amount,
    required this.totalTime,
    required this.offerId,
  });

  Map<String, dynamic> toJson() => {
        "contractId": contractId,
        "buyerId": buyerId,
        "sellerId": sellerId,
        "startingDate": startingDate,
        "endingDate": endingDate,
        "amount": amount,
        "totalTime": totalTime,
        "offerId": offerId,
      };

  static Contract fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Contract(
      contractId: snapshot['contractId'],
      buyerId: snapshot['buyerId'],
      sellerId: snapshot['sellerId'],
      startingDate: snapshot['startingDate'],
      endingDate: snapshot['endingDate'],
      amount: snapshot['amount'],
      totalTime: snapshot['totalTime'],
      offerId: snapshot['offerId'],
    );
  }
}
