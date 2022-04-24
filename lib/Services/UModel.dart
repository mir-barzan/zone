import 'dart:math';

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
      this.profilePhotoUrl = ""});

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
