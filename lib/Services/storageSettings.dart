import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class storageMeth {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageFileToFirebaseStorage(
      String childName, Uint8List file, bool isOffer) async {
    Reference ref =  _storage.ref().child(childName).child(_auth.currentUser!.uid);

    if (isOffer) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadLink = await snap.ref.getDownloadURL();
    return downloadLink;
  }
// Future<String> uploadImageListFileToFirebaseStorage(
//     String childName, List<Uint8List> file, bool isOffer) async {
//   Reference ref =  _storage.ref().child(childName).child(_auth.currentUser!.uid);
//
//   if(isOffer){
//     String id = const Uuid().v1();
//     ref = ref.child(id);
//   }
//   UploadTask uploadTask = ref.putData(file);
//   TaskSnapshot snap = await uploadTask;
//   String downloadLink = await snap.ref.getDownloadURL();
//   return downloadLink;
// }
}
