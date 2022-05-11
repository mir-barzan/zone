import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String result = "Error !";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'success';
      } else {
        print("Please fill the fields");
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  //USU
  Future<String> signUpUser({
    required String fname,
    required String lname,
    required String email,
    required String password,
  }) async {
    String result = "";
    try {
      if (fname.isNotEmpty ||
          lname.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //add user to the firebase database
        _firestore.collection('users').doc(cred.user!.uid);
        model.User user = model.User(
          fname: fname,
          lname: lname,
          email: email,
          password: password,
          uid: cred.user!.uid,
          username: fname + RandomStr,
        );
        await _firestore.collection('users').doc(cred.user!.uid).set(
          user.toJson(),
        );
        result = "success";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}

int random(min, max) {
  return min + Random().nextInt(max - min);
}

String RandomStr = random(1000, 9999).toString();