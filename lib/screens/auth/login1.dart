import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/fire_auth.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:zone/screens/auth/signup1.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import 'package:zone/widgets/widgets.dart';
import 'package:zone/components/components.dart';
import '../main_page.dart';
import 'package:zone/screens/auth/signup.dart';

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _isLoading = false;

  void signInUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await FireAuth().signInUser(context,
        email: _emailController.text, password: _passwordController.text);
    if (result != 'success') {
      showAlertDialog(
          context,
          "Make sure all fields are filled correctly or you didn't verify your email!",
          "",
          Icon(
            Icons.error,
            color: Colors.red,
            size: 60,
          ));
    } else {
      showAlertDialog(
          context,
          "",
          "Success",
          Icon(
            Icons.check,
            color: Colors.green,
          ));
      navigateToWithoutBack(
          context,
          mainPage(
            isFromSettings: false,
          ));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  const Upside(
                    imgUrl: "assets/images/login.png",
                  ),
                  const PageTitleBar(title: 'Login to your account'),
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
                          iconButton(context),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "or use your email account",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Form(
                            child: Column(
                              children: [
                                RoundedInputField(
                                    hintText: "Email",
                                    icon: Icons.email,
                                    controller: _emailController),
                                RoundedPasswordField(
                                  passwordController: _passwordController,
                                ),
                                switchListTile(),
                                RoundedButton(
                                    isLoading: _isLoading,
                                    text: 'LOGIN',
                                    press: () {
                                      // signInUser();
                                      signInUser();
                                    }),
                                const SizedBox(
                                  height: 10,
                                ),
                                UnderPart(
                                  title: "Don't have an account?",
                                  navigatorText: "Register here",
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp1()));
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: offersColor,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
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
      ),
    );
  }

  switchListTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 40),
      child: SwitchListTile(
        dense: true,
        title: const Text(
          'Remember Me',
          style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
        ),
        value: true,
        activeColor: offersColor,
        onChanged: (val) {},
      ),
    );
  }

  iconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        RoundedIcon(imageUrl: "assets/images/facebook.png"),
        SizedBox(
          width: 20,
        ),
        RoundedIcon(imageUrl: "assets/images/twitter.png"),
        SizedBox(
          width: 20,
        ),
        RoundedIcon(imageUrl: "assets/images/google.jpg"),
      ],
    );
  }
}
