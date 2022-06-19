// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:zone/additional/colors.dart';
// import 'package:zone/screens/auth/fire_auth.dart';
// import 'package:zone/screens/auth/login.dart';
// import 'package:zone/screens/auth/signup.dart';
// import 'package:zone/screens/main_page.dart';
// import 'package:zone/widgets/AdditionalWidgets.dart';
// import 'package:zone/widgets/text_field_input.dart';
//
// class signup extends StatefulWidget {
//   const signup({Key? key}) : super(key: key);
//
//   @override
//   State<signup> createState() => _signupState();
// }
//
// class _signupState extends State<signup> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _firstnameController = TextEditingController();
//   final TextEditingController _lastnameController = TextEditingController();
//
//   bool _isLoading = false;
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _firstnameController.dispose();
//     _lastnameController.dispose();
//   }
//
//   void signUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String result = await FireAuth().signUpUser(
//         context: context,
//         fname: _firstnameController.text,
//         lname: _lastnameController.text,
//         email: _emailController.text,
//         password: _passwordController.text);
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
//               height: 20,
//             ),
//             TextFieldInput(
//                 textEditingController: _firstnameController,
//                 hintText: "Enter your First Name",
//                 textInputType: TextInputType.name),
//             const SizedBox(
//               height: 20,
//             ),
//             TextFieldInput(
//                 textEditingController: _lastnameController,
//                 hintText: "Enter your Last Name",
//                 textInputType: TextInputType.name),
//             const SizedBox(
//               height: 20,
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
//             InkWell(
//               onTap: signUser,
//               child: Container(
//                   child: _isLoading
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                             color: primaryColor,
//                           ),
//                         )
//                       : const Text(
//                           'Register',
//                           style: (TextStyle(color: primaryColor)),
//                         ),
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
//                   child: const Text("have account?"),
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     navigateTo(context, const login());
//                   },
//                   child: Container(
//                     child: const Text("   Login",
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
