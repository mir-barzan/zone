class User {
  final String fname;
  final String lname;
  final String email;
  final String password;
  final String uid;

  const User({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "password": password,
        "uid": uid,
      };
}
