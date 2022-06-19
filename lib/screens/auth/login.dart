// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:zone/additional/colors.dart';
// import 'package:zone/screens/auth/fire_auth.dart';
// import 'package:zone/screens/auth/signup.dart';
// import 'package:zone/widgets/AdditionalWidgets.dart';
// import 'package:zone/widgets/text_field_input.dart';
//
// import '../main_page.dart';
//
// class login extends StatefulWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }
//
//   bool _isLoading = false;
//
//   void signInUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String result = await FireAuth().signInUser(context,
//         email: _emailController.text, password: _passwordController.text);
//     if (result != 'success') {
//       showAlertDialog(
//           context,
//           "Make sure all fields are filled correctly!",
//           result,
//           Icon(
//             Icons.error,
//             color: Colors.red,
//           ));
//     } else {
//       showAlertDialog(
//           context,
//           "",
//           "Success",
//           Icon(
//             Icons.check,
//             color: Colors.green,
//           ));
//       navigateToWithoutBack(
//           context,
//           mainPage(
//             isFromSettings: false,
//           ));
//     }
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 32),
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Container(),
//               flex: 1,
//             ),
//             const SizedBox(
//               height: 64,
//             ),
//             TextFieldInput(
//                 textEditingController: _emailController,
//                 hintText: "Enter your email",
//                 textInputType: TextInputType.emailAddress),
//             const SizedBox(
//               height: 20,
//             ),
//             TextFieldInput(
//               textEditingController: _passwordController,
//               hintText: "Enter your password",
//               textInputType: TextInputType.text,
//               isPass: true,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//               onTap: signInUser,
//               child: Container(
//                   child: const Text(
//                     'Login',
//                     style: (TextStyle(color: primaryColor)),
//                   ),
//                   alignment: Alignment.center,
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   decoration: const ShapeDecoration(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(4))),
//                     color: secColor,
//                   )),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Flexible(
//               child: Container(),
//               flex: 2,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   child: const Text("New Zoner?"),
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     navigateToWithoutBack(context, const signup());
//                   },
//                   child: Container(
//                     child: const Text("   Register",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: secColor)),
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
