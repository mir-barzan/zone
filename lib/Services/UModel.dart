import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  final String fname;
  final String lname;
  final String email;
  final String password;
  final String uid;
  final String username;
  final String bio;
  final String rating;
  final String rank;
  final String profilePhotoUrl;

  const User(
      {required this.fname,
      required this.lname,
      required this.email,
      required this.password,
      required this.uid,
      this.rating = "0",
      this.rank = "Zoner",
      this.bio = "",
      required this.username,
      this.profilePhotoUrl = "https://firebasestorage.googleapis.com/v0/b/zone-b3608.appspot.com/o/207-2074624_white-gray-circle-avatar-png-transparent-png.png?alt=media&token=b4ed042a-93cd-44fe-930d-98aad2bfb8cf"});

  Map<String, dynamic> toJson() =>
      {
        "fname": fname,
        "lname": lname,
        "email": email,
        "password": password,
        "uid": uid,
        "username": username,
        "bio": bio,
        "rank": rank,
        "rating": rating,
        "profilePhotoUrl": profilePhotoUrl,
      };
}
