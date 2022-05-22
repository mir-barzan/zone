import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:zone/Services/storageSettings.dart';

import 'offerModel.dart';

class FireStoreSettings{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //post the offer and save it in FireStore database

  Future<String> uploadOffer(
      bool isLoading,
      List faq,
    String title,
    String description,
     uid,
    String price,
    Uint8List file,
    fname, lname, username ,rating, rank, timeNeeded, categoryTags) async{
    String result = "Error!";
        try{
          isLoading = true;
          String offerId = Uuid().v1();
          String photoUrl = await storageMeth().uploadImageFileToFirebaseStorage('Offers', file, true);
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
            categoryTags: [],
            faq: []




          );
          _firestore.collection('Category').doc(offerId).set(offer.toJson());

          result = 'success';

        }catch(e){
          result = 'Error';

        }
        isLoading = false;
        return result;


  }

}