import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

    return Scaffold(

      appBar: AppBar(
        title: const Text('Zone'),
        backgroundColor: ,
      ),
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
      backgroundColor: Colors.cyan.shade50,
    );
  }
}
