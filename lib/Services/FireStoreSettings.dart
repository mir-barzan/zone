import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:zone/Services/contractModel.dart';
import 'package:zone/Services/storageSettings.dart';
import 'package:zone/screens/mainPages/InDashBoard/chats/chatMsg.dart';

import 'offerModel.dart';
import 'portfolioModel.dart';

class FireStoreSettings{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //post the offer and save it in FireStore database
  Future<String> openChat(String recieverId) async {
    String result = "error";
    String chatId = Uuid().v1();
    try {
      Chatt chat = Chatt(
        chatId: chatId,
        isActive: true,
        recieverId: recieverId,
        senderId: FirebaseAuth.instance.currentUser!.uid,
      );
      _firestore.collection("Chats").doc(chatId).set(chat.toJson());
      result = "success";
    } catch (e) {
      print(e.toString());
      result = 'error';
    }
    return result;
  }

  Future<String> createContract(
    amount,
    StartingDate,
    SellerUid,
    BuyerUid,
    OfferId,
  ) async {
    String contractId = "";
    try {
      contractId = Uuid().v1();
      Contract contract = Contract(
          totalTime: null,
          endingDate: null,
          sellerId: SellerUid,
          buyerId: BuyerUid,
          contractId: contractId,
          startingDate: DateTime.now().toString(),
          amount: amount,
          offerId: OfferId);
      await _firestore
          .collection('Contracts')
          .doc(contractId)
          .set(contract.toJson());
      await _firestore.collection('users').doc(SellerUid).set({
        'activeContracts': FieldValue.arrayUnion([contractId])
      }, SetOptions(merge: true));
      await _firestore.collection('users').doc(BuyerUid).set({
        'activeContracts': FieldValue.arrayUnion([contractId])
      }, SetOptions(merge: true));

      Fluttertoast.showToast(msg: 'Contract started successfully');
      return contractId;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error starting contract');
      return contractId;
    }
  }

  Future<String> uploadOffer(
      bool isLoading,
      List faqQuestions,
      String title,
      String description,
      uid,
      String price,
      Uint8List file,
      fname,
      lname,
      username,
      rating,
      rank,
      timeNeeded,
      categoryTags,
      List faqAnswers) async {
    String result = "Error!";

    try {
      isLoading = true;
      String offerId = Uuid().v1();
      String photoUrl = await storageMeth()
          .uploadImageFileToFirebaseStorage('Offers', file, true);

      Offer offer = Offer(
        title: title,
        fname: fname,
        lname: lname,
        username: username,
        uid: uid,
        description: description,
        rating: rating,
        rank: rank,
        PhotoUrl: photoUrl,
        datePublished: DateTime.now(),
        timeNeeded: timeNeeded,
        price: price,
        offerId: offerId,
        categoryTags: categoryTags,
        faqQuestion: faqQuestions,
        faqAnswer: faqAnswers,
        searchKeys: searchKeys(categoryTags),
        ratingCounter: "0",
        totalRating: "0",
      );
      _firestore.collection('Category').doc(offerId).set(offer.toJson());

      result = 'success';
    } catch (e) {
      result = 'Error';
    }
    isLoading = false;
    return result;
  }

  Future<String> uploadPortfolio(
      imageList, String title, String description, uid, fname, lname) async {
    String result = "Error!";
    try {
      String portfolioId = Uuid().v1();

      Portfolio portfolio = Portfolio(
        title: title,
        fname: fname,
        lname: lname,
        uid: uid,
        description: description,
        datePublished: DateTime.now(),
        portfolioId: portfolioId,
        imageList: imageList,
      );
      _firestore
          .collection('Portfolio')
          .doc(portfolioId)
          .set(portfolio.toJson());

      result = 'success';
    } catch (e) {
      result = 'Error';
    }
    return result;
  }
}

searchKeys(List<String> c) {
  List<String> searchKeys = [];
  for (int i = 0; i < c.length; i++) {
    for (int x = 1; x < c[i].length + 1; x++) {
      searchKeys.add(c[i].substring(0, x).toLowerCase());
    }
  }
  return searchKeys;
}
