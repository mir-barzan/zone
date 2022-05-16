import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import '../../main_page.dart';

class reviewAndSubmit extends StatefulWidget {
  const reviewAndSubmit({Key? key}) : super(key: key);

  @override
  State<reviewAndSubmit> createState() => _reviewAndSubmitState();
}

class _reviewAndSubmitState extends State<reviewAndSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children:[ Center(
            child: Column(
          children: [
            Container(height: 10,),
            DetailsInformation("This is how your offer will be shown in the Offers page"),
            Container(height: 10,),
            Column(
              children: [
                Text("Your Offer", style: TextStyle(fontSize: 30, color: offersColor),),
                Container(height: 10,),
                Icon(Icons.arrow_downward, size: 50,color: offersColor,)
              ],
            ),
            Container(

                child: SvgPicture.asset(
              'assets/images/offerIllustrate.svg',
            )),
            Divider(height: 35,thickness: 2,),

            Container(
              height: 50,
              width: 220,
              child: ElevatedButton(
                onPressed: () {
                  //todo validation

                },
                child: Icon(Icons.check, size: 45,),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: offersColor),
              ),
            ),
          ],
        )),
      ]),
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
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: offersColor),
                        )),
                    TextButton(
                        onPressed: () {
                          navigateToWithoutBack(context, mainPage());
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(color: offersColor),
                        )),
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
