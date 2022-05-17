import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/addOfferMain/offerCard.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import '../../main_page.dart';

class reviewAndSubmit extends StatefulWidget {
  const reviewAndSubmit({Key? key}) : super(key: key);

  static ValueNotifier<String> newTitle = ValueNotifier('');
  static ValueNotifier<int> newPrice = ValueNotifier(0);


  @override
  State<reviewAndSubmit> createState() => _reviewAndSubmitState();
}

class _reviewAndSubmitState extends State<reviewAndSubmit> {
  @override
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: CancelIcon(),
        title: Wrap(
            children: [ Text(
              "New Offer",
              style: TextStyle(fontSize: 34, color: offersColor),
            ), Container(
                height: 50,
                width: 50,
                child: SvgPicture.asset(
                  'assets/images/offerIllustrate.svg',

                )),
            ]),
        actions: [],
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 1,
      ),
      body: ListView(children: [
        Center(
            child: Column(
              children: [
                Container(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Column(
                      children: [
                        DetailsInformation(
                            "This is how your offer will be shown in the Offers page"),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Your Offer",
                      style: TextStyle(fontSize: 30, color: offersColor),
                    ),
                    Container(
                      height: 10,
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 50,
                      color: offersColor,
                    )
                  ],
                ),
            MultiValueListenableBuilder(
              valueListenables: [
                reviewAndSubmit.newTitle,
                reviewAndSubmit.newPrice
              ],

              builder: (context, values, child) {
                // Get the updated value of each listenable
                // in values list.
                return Container(width: 350,height: 400,child: OfferCard(title: values.elementAt(0), price: values.elementAt(1)).makeCard(),);
              },

            ),
                
                Divider(
                  height: 35,
                  thickness: 2,
                ),
                Container(
                  height: 50,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: () {
                      //todo validation
                    },
                    child: Icon(
                      Icons.check,
                      size: 45,
                    ),
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

  Future<String> loadString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }


}
