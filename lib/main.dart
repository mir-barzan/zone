import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/auth/login.dart';
import 'package:zone/screens/auth/listner.dart';
import 'package:zone/screens/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Welcome To The Zone';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  @override
  Widget build(BuildContext context) {
    // return listner();
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return const mainPage();
            }else if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'),);
            }
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return const login();

    });
  }
}

