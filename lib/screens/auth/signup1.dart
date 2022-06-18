import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/fire_auth.dart';
import 'package:zone/screens/auth/login.dart';
import 'package:zone/screens/auth/login1.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:zone/screens/main_page.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import 'package:zone/widgets/widgets.dart';
import 'package:zone/components/components.dart';
import 'package:zone/screens/auth/login.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _signup1State();
}

class _signup1State extends State<SignUp1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
  }

  void signUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await FireAuth().signUpUser(
        context: context,
        fname: _firstnameController.text.trim(),
        lname: _lastnameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    navigateToWithoutBack(context, login1());
    if (result != 'success') {
      Fluttertoast.showToast(msg: "Error, Please try again.");
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/register.png",
                ),
                const PageTitleBar(title: 'Create New Account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                  controller: _emailController,
                                  hintText: "Email",
                                  icon: Icons.email),
                              RoundedInputField(
                                  controller: _firstnameController,
                                  hintText: "Name",
                                  icon: Icons.person),
                              RoundedInputField(
                                  controller: _lastnameController,
                                  hintText: "Surname",
                                  icon: Icons.person),
                              RoundedPasswordField(
                                passwordController: _passwordController,
                              ),
                              RoundedButton(
                                  isLoading: _isLoading,
                                  text: 'REGISTER',
                                  press: () {
                                    signUser();
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const login1()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
