import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zone/screens/auth/signup.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 300,
              child: TextField(decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Username',
                hintText: 'Enter Your Username',
                alignLabelWithHint: true,
                filled: true,

              ),
              ),
            )  ,
            SizedBox(width: 10,height: 10,),

            Container(
              width: 300,
              child: TextField(decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Password',
                hintText: 'Enter Your Password',
                alignLabelWithHint: true,
                filled: true,



              )),
            ),
            SizedBox(height: 50,),
            MaterialButton(
                child: Text("Login",style: TextStyle(
                  color: Colors.white,
                ),
                ),
                color: Colors.lightBlue[900],
                minWidth: 125,
                onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            )

          ],
        ),

      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
        new RichText(
        text: new TextSpan(text: 'New User ? ', children: [
          new TextSpan(
            text: 'Register',
            style: TextStyle(
              color: Colors.lightBlue[900],
              fontSize: 14,
            ),
            recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const signup()),
            ),
          )
        ]),
      )
            // Text("New User?", style: TextStyle(fontSize: 16),),
            // SizedBox(width: 5, height: 5,),
            // MaterialButton(
            //   child: Text("Register",style: TextStyle(
            //     color: Colors.white,
            //   ),
            //   ),
            //   color: Colors.transparent,
            //   minWidth: 125,
            //   onPressed: (){},
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10)
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
