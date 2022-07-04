import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zone/Services/UModel.dart' as model;
import 'package:zone/widgets/AdditionalWidgets.dart';

class FireAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //USO
  Future<void> signOut() async {
    await _auth.signOut();
  }


//Update All
  updateCred(
      {required String oldCred, required String newCred}) async {
    String result = "Error";
    try {
      if (oldCred.isNotEmpty && newCred.isNotEmpty) {
        var collection = FirebaseFirestore.instance.collection('users');
        collection.doc(FirebaseAuth.instance.currentUser!.uid).update(
            {oldCred: newCred}).then((value) => print('updated')).catchError((
            error) => print('Update failed: $error'));
      }
      result = "success";
    }catch(e){
      result = e.toString();
      print(e);
    }

    return result;
  }
  updatePassword(
      {required String newCred}) async {
    String result = "Error";
    try {
      if (newCred.isNotEmpty) {
        var FirebaseUser = await _auth.currentUser!;
        FirebaseUser.updatePassword(newCred);
      }
      result = "success";
    }catch(e){
      result = e.toString();
    }

    return result;
  }
  updateEmail(
      {required String newCred}) async {
    String result = "Error";
    try {
      if (newCred.isNotEmpty) {
        var FirebaseUser = await _auth.currentUser!;
        FirebaseUser.updateEmail(newCred);
      }
      result = "success";
    }catch(e){
      result = e.toString();
    }

    return result;
  }

  //ULI
  Future<String> signInUser(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    String result = "error";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      print("########\n#######\n#######");

      print("########\n#######\n#######");
      result = "success";
    } catch (err) {}
    return result;
  }

  //TODO:::: Fix this part
//verify phone number
//   Future<String> verifyPhoneNumber({
//     required String phoneNumber,
//   }) async {
//     String result = "Error !";
//     try {
//       if (phoneNumber.isNotEmpty) {
//         await _auth.verifyPhoneNumber(
//             phoneNumber: phoneNumber,
//             timeout: Duration(seconds: 60),
//             verificationCompleted: (AuthCredential credential) async {
//               await _auth.signInWithCredential(credential);
//               result = 'success';
//             },
//             codeAutoRetrievalTimeout: (String verificationId) {
//               print(verificationId);
//             },codeSent: (String verificationId, [int forceResend]) {
//               print(verificationId);
//             },
//             verificationFailed: (exception) {
//               result = exception.toString();
//             });
//       } else {
//         print("Please fill the fields");
//       }
//     } catch (err) {
//       result = err.toString();
//     }
//     return result;
//   }
//
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      showAlertDialog(
          context,
          "E-mail verification code sent you can login after you verify your email",
          "",
          Icon(
            Icons.check_circle,
            color: offersColor,
            size: 80,
          ));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  //USU
  Future<String> signUpUser({
    required String fname,
    required String lname,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String result = "error";
    try {
      if (fname.isNotEmpty ||
          lname.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await sendEmailVerification(context);
        //add user to the firebase database
        _firestore.collection('users').doc(cred.user!.uid);
        model.User user = model.User(
            fname: fname.toLowerCase().trim(),
            lname: lname.toLowerCase().trim(),
            email: email.trim(),
            password: password,
            uid: cred.user!.uid,
            username: fname.toLowerCase() + lname.toLowerCase() + RandomStr,
            dateCreated: DateTime.now().toString(),
            activeContracts: [],
            completedContracts: [],
            favoriteOffers: [],
            totalRating: '0');
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
        result = "success";
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.toString().split(']')[1]);
      print(e.toString());
    }
    return result;
  }
}

int random(min, max) {
  return min + Random().nextInt(max - min);
}

String RandomStr = random(1000, 9999).toString();