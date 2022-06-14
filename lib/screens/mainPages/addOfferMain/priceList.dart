import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/screens/mainPages/addOfferMain/reviewAndSubmit.dart';

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
  TextEditingController _moneyController = TextEditingController();

  int counter = 0;
  final int minValue = 5;
  final int maxValue = 10000;
  final List<String> daysList = [
    'less than or 1 day',
    '2 days to 3 days',
    '4 days to 5 days',
    '6 days to week',
    'more than a week',
    'more than a month'
  ];
  moneyString(x) {
    return x.toString();
  }
  List<bool> isPressedList = [false,false,false, false, false, false];

  String classChoice = '';
  String daysValue = "Days";
  // controller.updateValue(1234.0);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: CancelIcon(),
        title: Wrap(
            children:[ Text(
              "New Offer",
              style: TextStyle(fontSize: 34, color: offersColor),
            ),Container(
                height: 50,
                width: 50,
                child: Icon(Icons.local_offer, color: offersColor,)),
            ]),
        actions: [],
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 1,
      ),
      body: ListView(children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DetailsInformation(
                  "Choosing the right amount of money according to your Offer to sell and gain customers"),
              Container(
                height: 15,
              ),

              Text("Price", style: TextStyle(fontSize: 20),),
              Container(height: 4,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                FittedBox(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: offersColor,
                          ),
                          padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                          iconSize: 32.0,
                          color: offersColor,
                          onPressed: () {
                            setState(() {
                              if (counter > minValue) {
                                counter--;
                              }
                              reviewAndSubmit.newPrice.value = counter.toString();
                            });
                          },
                        ),

                        Container(

                          child: Row(
                            children: [
                              Icon(Icons.attach_money, color: primaryColor,),
                              Text(
                                '${moneyString(counter)}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: offersColor.shade800,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),Icon(Icons.attach_money, color: offersColor,),Container(width: 4,)
                            ],
                          ),


                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: offersColor,
                          ),
                          padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                          iconSize: 32.0,
                          color: offersColor,
                          onPressed: () {
                            setState(() {
                              if (counter < maxValue) {
                                counter++;
                              }
                              reviewAndSubmit.newPrice.value = counter.toString();
                              _moneyController.text = moneyString(counter);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],),
              Divider(height: 40,thickness: 2,),
              DetailsInformation("Managing to submit the work before/at the right time makes the customer happy and increase the probabilty to reorder"),
              Container(height: 5,),
              Text("Days to complete the work", style: TextStyle(fontSize: 20),),
              Container(
                height: 10,
              ),
              // Container(
              //   child: Padding(
              //     padding: EdgeInsets.all(10),
              //     child: DropdownButtonFormField<String>(
              //       decoration: InputDecoration.collapsed(
              //         hintText: " ",
              //       ),
              //       value: daysValue,
              //       hint: Text(" Days "),
              //       items: daysList.map((sugar) {
              //         return DropdownMenuItem(
              //           value: sugar,
              //           child: Text('$sugar f'),
              //         );
              //       }).toList(),
              //       onChanged: (sugar) => setState(() => daysValue = sugar!),
              //     ),
              //     //todo DropdownButton
              //   ),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: offersColor, width: 1.0),
              //     borderRadius: BorderRadius.all(Radius.circular(
              //         5.0) //                 <--- border radius here
              //     ),
              //   ),
              // ),
      Wrap(
        children: [
          SizedBox(height: 30),
          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = true;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[5] = false;
                isPressedList[4] = false;
                isPressedList[3] = false;
                reviewAndSubmit.newtimeNeeded.value = 'less than or 1 day';

              });
            },
            child: ChoiceButton(
              isPressed: isPressedList[0],
              label: 'less than or 1 day',
            ),
          ),
          Container(height: 4,),

          GestureDetector(

            onTap: (){
              setState(() {
                isPressedList[0] = false;
                isPressedList[5] = false;
                isPressedList[2] = false;
                isPressedList[1] = true;
                isPressedList[4] = false;
                isPressedList[3] = false;
                reviewAndSubmit.newtimeNeeded.value = '2 days to 3 days';

              });
            },
            child: ChoiceButton(
              isPressed: isPressedList[1],
              label: '2 days to 3 days',
            ),
          ),
          Container(height: 4,),

          GestureDetector(
            onTap: (){

              setState(() {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[5] = false;
                isPressedList[2] = true;
                isPressedList[4] = false;
                isPressedList[3] = false;
              reviewAndSubmit.newtimeNeeded.value = '4 days to 5 days';

              });
            },
            child: ChoiceButton(
              isPressed: isPressedList[2],
              label: '4 days to 5 days',
            ),
          ),
          Container(height: 4,),

          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = true;
                isPressedList[4] = false;
                isPressedList[5] = false;
                reviewAndSubmit.newtimeNeeded.value = '6 days to week';

              });
            },
            child: ChoiceButton(
              isPressed: isPressedList[3],
              label: '6 days to week',
            ),
          ),
          Container(height: 4,),

          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[4] = true;
                isPressedList[3] = false;
                isPressedList[5] = false;
                reviewAndSubmit.newtimeNeeded.value = 'more than a week';

              });
            },
            child: ChoiceButton(
              isPressed: isPressedList[4],
              label: 'more than a week',
            ),
          ),
          Container(height: 4,),

          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[5] = true;
                isPressedList[4] = false;
                isPressedList[3] = false;
                reviewAndSubmit.newtimeNeeded.value = 'more than a month';

              });
            },
            child: ChoiceButton(
              isPressed: isPressedList[5],
              label: 'more than a month',
            ),
          ),
          Container(height: 4,),

        ],
      )


            ],
          ),
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
                          navigateToWithoutBack(
                              context,
                              mainPage(
                                isFromSettings: false,
                              ));
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
class ChoiceButton extends StatelessWidget {

  final String label;
  final bool isPressed;

  ChoiceButton({required this.label,required this.isPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      padding: EdgeInsets.all(5),
      height: 50,


      decoration: BoxDecoration(
        color: isPressed ? offersColor : Colors.transparent,
        border: Border.all(
          color: offersColor,
          width: 2
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isPressed ? Colors.white : offersColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}