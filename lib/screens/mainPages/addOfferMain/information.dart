import 'dart:async';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:zone/screens/mainPages/addOfferScreen.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/main_page.dart';
import 'package:zone/widgets/text_field_input.dart';
import 'package:zone/screens/mainPages/addOfferScreen.dart';
import '../../../additional/colors.dart';
import '../../../widgets/AdditionalWidgets.dart';

class informationScreen extends StatefulWidget {
  const informationScreen({Key? key}) : super(key: key);

  @override
  State<informationScreen> createState() => _informationScreenState();
}

class _informationScreenState extends State<informationScreen> {
  TextEditingController _field1 = TextEditingController();
  TextEditingController _fQuestion = TextEditingController();
  TextEditingController _fAnswer = TextEditingController();
  TextEditingController _IWill = TextEditingController();
  TextEditingController _Details = TextEditingController();
changeScreen2(int x){
  addOfferScreen A = new addOfferScreen();

}
  int eIndex = 0;
  Color QuestionColor = Colors.red;
  List<ExpansionTileCard> questions = [];
  bool questionsChecker = false,
      detailsChecker = false,
      titleChecker = false,
      totalState = false;

  qChecker() {
    if (eIndex < 5) {
      questionsChecker = false;
      QuestionColor = Colors.red;
    } else {
      questionsChecker = true;
      QuestionColor = Colors.green;
    }
    print(questionsChecker);
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("At least you should provide 5 complete FAQs."),
      actions: [
        TextButton(
            onPressed: () {
              navigatePop(context, widget);
            },
            child: Text(
              "Ok",
              style: TextStyle(color: offersColor),
            )),
      ],
    );
    checkQuestionField() {
      if (_fAnswer.text.length > 6 && _fQuestion.text.length > 6) {
        setState(() {
          createQuestionAndAnswer(_fQuestion.text, _fAnswer.text);
        });
      } else {}
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: CancelIcon(),
        title: Text(
          "New Offer",
          style: TextStyle(fontSize: 34, color: offersColor),
        ),
        actions: [ButtonChoice()],
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Wrap(children: [
            DetailsInformation(
                "Write a title for what you offer without 'I will' as its built-in your words "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I will ",
                  style: TextStyle(fontSize: 30),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: TextField(
                      cursorColor: offersColor,
                      obscureText: false,
                      decoration: InputDecoration(
                        fillColor: offersColor,
                        hintText: "What are you good at...",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: offersColor),
                        ),
                      ),
                      maxLength: 40,
                      style: TextStyle(fontSize: 18),
                    ),
                    width: 120,
                    height: 80,
                  ),
                )
              ],
            ),
            Divider(
              height: 50,
              thickness: 1,
            ),
            DetailsInformation(
                "Writing in a nice way that provide the customer with many details, why you, and how you are special will increase the probability of buying your offer"),
            Container(
              height: 250,
              child: Column(
                children: [
                  Text(
                    "Details about your offer",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      cursorColor: offersColor,
                      maxLines: 7,
                      maxLength: 400,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: offersColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                      )),
                ],
              ),
            ),
            Divider(
              height: 50,
              thickness: 1,
            ),
            FittedBox(
              child: Row(
                children: [
                  Icon(
                    Icons.help,
                    size: 50,
                    color: offersColor,
                  ),
                  Text(
                    "  Add new frequently asked question",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            DetailsInformation(
                "FAQs enable you to deal with specific queries that your customers have about your business. They also represent another way to reach out and connect with your target audience. Therefore, it is one of the most important elements of your strategy. Like this one for example"),
            ExpansionTileCard(
              elevation: 6,
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: offersColor,
              ),
              expandedTextColor: offersColor,
              title: Text(
                'What should I do next?',
                style: TextStyle(color: offersColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      Text(
                        "You have to provide your customers with at least 5 FAQ that related to your offer.",
                        style: TextStyle(color: offersColor),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 50,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      "Question",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            controller: _fQuestion,
                            cursorColor: offersColor,
                            obscureText: false,
                            decoration: InputDecoration(
                              fillColor: offersColor,
                              hintText: "Frequently Asked Question",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: offersColor),
                              ),
                            ),
                            maxLength: 80,
                            style: TextStyle(fontSize: 18),
                          ),
                          width: 120,
                          height: 80,
                        ),
                      ),
                      Text(
                        "?",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Answer",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            controller: _fAnswer,
                            cursorColor: offersColor,
                            obscureText: false,
                            decoration: InputDecoration(
                              fillColor: offersColor,
                              hintText: "Question Answer",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: offersColor),
                              ),
                            ),
                            maxLength: 80,
                            style: TextStyle(fontSize: 18),
                          ),
                          width: 120,
                          height: 80,
                        ),
                      ),
                      Text(
                        ".",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        //todo create the questions
                        checkQuestionField();
                        PageState();
                      },
                      child: Text("Add"),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), primary: offersColor),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(20.0),
            ),
            Container(
              height: 40,
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Questions available",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Minimum 5",
                  style: TextStyle(color: Colors.black45),
                ),
                Text(
                  " $eIndex",
                  style: TextStyle(color: QuestionColor),
                )
              ],
            )),
            Divider(
              thickness: 2,
            ),
            Container(
              height: 5,
            ),
            Wrap(
              spacing: 20,
              children: questions,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            questions.removeLast();
                            if (eIndex != 0) {
                              eIndex -= 1;
                            }
                            qChecker();
                            PageState();
                          });
                        },
                        icon: Icon(
                          Icons.minimize,
                          color: Colors.red,
                          size: 25,
                        )),
                    Text(
                      "Remove",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ])
        ],
      )),
    );
  }

  void createQuestionAndAnswer(String question, String answer) {
    questions.add(ExpansionTileCard(
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: offersColor,
      ),
      expandedTextColor: offersColor,
      title: Text(
        '$question?',
        style: TextStyle(color: offersColor),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Text(
                '$answer.',
                style: TextStyle(color: offersColor),
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    ));

    setState(() {
      eIndex += 1;
      _fQuestion.clear();
      _fAnswer.clear();
      qChecker();
      PageState();
    });
  }

  DetailsInformation(String label) {
    return Wrap(
      children: [
        Container(
          height: 5,
        ),
        Center(
          child: Icon(
            Icons.info_outline,
            color: Colors.grey,
          ),
        ),
        Text(
          "  $label.",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
        Container(
          height: 5,
        ),
      ],
    );
  }

  PageState() {
    if (_IWill.text.isNotEmpty ||
        _Details.text.isNotEmpty ||
        questionsChecker == true) {
      setState(() {
        totalState = true;
      });
    } else {
      totalState = false;
    }
    print(totalState);
  }

  ButtonChoice() {
    if (totalState == true) {
      return Container(
        height: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              //todo create the questions
            },
            child: Text("Next"),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), primary: offersColor),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              //todo create the questions
              changeScreen()



            },
            child: Text("Next"),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), primary: Colors.grey),
          ),
        ),
      );
    }
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
