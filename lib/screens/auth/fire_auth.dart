import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zone/screens/auth/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zone/Services/UModel.dart' as model;

class FireAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //USO
  Future<void> signOut() async {
    await _auth.signOut();
  }
  //ULI
  Future<String> signInUser({
    required String email,
    required String password,
  })async{
    String result = "Error !";
    try{
    if(email.isNotEmpty || password.isNotEmpty){
      result = 'success';
    }else{
      print("Please fill the fields");
    }
    }catch(err){
    result = err.toString();
    }
    return result;
  }
  //USU
  Future<String> signUpUser({
    required String fname,
    required String lname,
    required String email,

  }) async {
    String result = "";
    try {
      if (fname.isNotEmpty ||
          lname.isNotEmpty ||
          email.isNotEmpty ||

          email: email,
          password: password,
          uid: cred.user!.uid,
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
