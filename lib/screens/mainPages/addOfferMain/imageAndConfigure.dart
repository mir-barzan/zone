import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../../main_page.dart';

class imageAndConfigureScreen extends StatefulWidget {
  const imageAndConfigureScreen({Key? key}) : super(key: key);

  @override
  State<imageAndConfigureScreen> createState() =>
      _imageAndConfigureScreenState();
}

class _imageAndConfigureScreenState extends State<imageAndConfigureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: CancelIcon(),
        title: Text(
          "New Offer",
          style: TextStyle(fontSize: 34, color: offersColor),
        ),
        actions: [],
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          DetailsInformation("Choosing the right photo will reflex your Offer cover book. Also, please make sure that the image you are selecting is well showing what you offer"),
          Container(height: 15,),
          Center(
            child: Text(
              "Please choose your Offer image",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(height: 10,),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: IconButton(
              icon: Icon(Icons.add_a_photo, color: Colors.black54,size: 35,),
              onPressed: (){},
            ),

          ),
        ],),
      )),
    );
  }
  CancelIcon() {
    return IconButton(
        onPressed: () {
          setState(() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(""),
                  content: Text("Are you sure you want to leave?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          navigatePop(context, widget);
                        },
                        child:
                        Text(
                          "Cancel",
                          style: TextStyle(color: offersColor),
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          navigateToWithoutBack(context, mainPage());                        },
                        child:
                        Text(
                          "Ok",
                          style: TextStyle(color: offersColor),
                        )
                    ),
                  ],
                );
                ;
              },
            );
          });
        },
        icon: Icon(
          Icons.close,
          color: Colors.black,
        ));
  }
}
