import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// void getUserName(String userName) async {
//   DocumentSnapshot snap = await FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid).get();
//   setState{(){
//     userName = snap.data()!['fname'];
//   }
//       }
