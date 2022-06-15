import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../additional/colors.dart';
import '../../../widgets/AdditionalWidgets.dart';
import '../addOfferMain/priceList.dart';

class secondRequirements extends StatefulWidget {
  const secondRequirements({Key? key}) : super(key: key);

  @override
  State<secondRequirements> createState() => _secondRequirementsState();
}

class _secondRequirementsState extends State<secondRequirements> {
  List<bool> isPressedList = [false, false, false, false, false, false];
  final List<String> daysList = [
    'less than or 1 day',
    '2 days to 3 days',
    '4 days to 5 days',
    '6 days to week',
    'more than a week',
    'more than a month'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Expanded(
              child: SvgPicture.asset(
            'assets/images/zoneLogo.svg',
            color: primaryColor,
            width: 180,
          )),
          backgroundColor: offersColor,
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Container(
                height: 15,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'Last, choose your requirement time limit.',
                          maxLines: 2,
                          style: TextStyle(fontSize: 19, color: primaryColor),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: offersColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    height: 15,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: offersColor,
                    size: 50,
                  ),
                ],
              ),
              Container(
                height: 35,
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  children: [
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPressedList[0] = true;
                          isPressedList[1] = false;
                          isPressedList[2] = false;
                          isPressedList[5] = false;
                          isPressedList[4] = false;
                          isPressedList[3] = false;
                        });
                      },
                      child: ChoiceButton(
                        isPressed: isPressedList[0],
                        label: 'less than or 1 day',
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPressedList[0] = false;
                          isPressedList[5] = false;
                          isPressedList[2] = false;
                          isPressedList[1] = true;
                          isPressedList[4] = false;
                          isPressedList[3] = false;
                        });
                      },
                      child: ChoiceButton(
                        isPressed: isPressedList[1],
                        label: '2 days to 3 days',
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPressedList[0] = false;
                          isPressedList[1] = false;
                          isPressedList[5] = false;
                          isPressedList[2] = true;
                          isPressedList[4] = false;
                          isPressedList[3] = false;
                        });
                      },
                      child: ChoiceButton(
                        isPressed: isPressedList[2],
                        label: '4 days to 5 days',
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPressedList[0] = false;
                          isPressedList[1] = false;
                          isPressedList[2] = false;
                          isPressedList[3] = true;
                          isPressedList[4] = false;
                          isPressedList[5] = false;
                        });
                      },
                      child: ChoiceButton(
                        isPressed: isPressedList[3],
                        label: '6 days to week',
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPressedList[0] = false;
                          isPressedList[1] = false;
                          isPressedList[2] = false;
                          isPressedList[4] = true;
                          isPressedList[3] = false;
                          isPressedList[5] = false;
                        });
                      },
                      child: ChoiceButton(
                        isPressed: isPressedList[4],
                        label: 'more than a week',
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPressedList[0] = false;
                          isPressedList[1] = false;
                          isPressedList[2] = false;
                          isPressedList[5] = true;
                          isPressedList[4] = false;
                          isPressedList[3] = false;
                        });
                      },
                      child: ChoiceButton(
                        isPressed: isPressedList[5],
                        label: 'more than a month',
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: offersColor, width: 2),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  "Submit",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 19, color: primaryColor),
                                ),
                                Icon(
                                  Icons.check,
                                  color: primaryColor,
                                  size: 50,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: offersColor,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
