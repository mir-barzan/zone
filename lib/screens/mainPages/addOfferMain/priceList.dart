import 'package:flutter/material.dart';

import '../../../additional/colors.dart';
import '../../../widgets/AdditionalWidgets.dart';
import '../../main_page.dart';

class priceList extends StatefulWidget {
  const priceList({Key? key}) : super(key: key);

  @override
  State<priceList> createState() => _priceListState();
}

class _priceListState extends State<priceList> {
  @override
  // controller.updateValue(1234.0);
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
      body: ListView(
        children:[ Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DetailsInformation("Choosing the right amount of money according to your Offer to sell and gain customers"),
                  Container(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: TextField(


                          keyboardType: TextInputType.number,
                          cursorColor: offersColor,
                          obscureText: false,
                          decoration: InputDecoration(
                            fillColor: offersColor,
                            hintText: "",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: offersColor),
                            ),
                          ),
                          maxLength: 5,
                          style: TextStyle(fontSize: 20),
                        ),
                        width: 60,
                        height: 80,
                      ),Text(
                        " \$ ",
                        style: TextStyle(fontSize: 30, color: offersColor),
                      ),
                    ],
                  ),
                ],),
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
