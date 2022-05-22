import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:zone/Services/storageSettings.dart';

import 'offerModel.dart';

class FireStoreSettings{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //post the offer and save it in FireStore database

  Future<String> uploadOffer(
      String Category,
    String title,
    String description,
    String uid,
    String price,
    Uint8List file,
    String fname, lname, username ,rating, rank, PhotoUrl, offerUrl, timeNeeded) async{
    String result = "Error!";
        try{

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
            PhotoUrl: PhotoUrl,
            offerUrl: offerUrl,
            datePublished: DateTime.now(),
            timeNeeded: timeNeeded,
            price: price,
            offerId: offerId




          );
          _firestore.collection(Category).doc(offerId).set(offer.toJson());
          result = 'success';

        }catch(e){
          result = 'Error';

        }
        return result;
  }
}