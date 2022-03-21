import 'package:flutter/material.dart';

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
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt_sharp), iconSize: 50, color: Colors.white38,)

          ],
        ),

      ),
    );
  }
}
