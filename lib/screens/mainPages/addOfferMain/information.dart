import 'dart:async';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone/Services/changeScreenProvider.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/screens/mainPages/addOfferMain/addOfferScreen.dart';
import 'package:zone/screens/mainPages/addOfferMain/imageAndConfigure.dart';
import 'package:zone/screens/mainPages/addOfferMain/reviewAndSubmit.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/main_page.dart';
import 'package:zone/widgets/text_field_input.dart';
import '../../../additional/colors.dart';
import '../../../widgets/AdditionalWidgets.dart';

class informationScreen extends StatefulWidget {
  const informationScreen({Key? key}) : super(key: key);

  @override
  State<informationScreen> createState() => informationScreenState();
}

class informationScreenState extends State<informationScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  addOfferScreen addScreen = new addOfferScreen();
  TextEditingController _field1 = TextEditingController();
  TextEditingController _fQuestion = TextEditingController();
  TextEditingController _fAnswer = TextEditingController();
  TextEditingController _IWill = TextEditingController();
  TextEditingController _Details = TextEditingController();
  TextEditingController _controller = TextEditingController();
  String title = "";
  List<String> tempList = [];

// void searchOptions(){
//
//     String temp = "";
//     for(int j = 0; j<tagss.length; j++){
//       for (int i = 0; i < tagss.elementAt(j).toString().length; i++) {
//         temp = temp + tagss.elementAt(j)[i];
//         tempList.add(temp);
//       }
//
//
//   }
// }
  getTitle() {
    return _IWill.text;
  }

  // _getAndSetIndex(x){
  //   Provider.of<ChangeScreenProvider>(context, listen: false).getAndSetIndex();
  // }
  int eIndex = 0;
  Color QuestionColor = Colors.red;
  List<ExpansionTileCard> questions = [];
  bool questionsChecker = false,
      detailsChecker = false,
      titleChecker = false,
      totalState = false;
  int maxLines = 100;

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

  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  String? value;

  String categoryValue = "Category";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final List<CategoryTag> _category = <CategoryTag>[];
  List<String> tagss = [];
  List faqQuestion = [];
  List faqAnswer = [];

  Iterable<Widget> get actorWidgets {
    return _category.map((CategoryTag tags) {
      return Padding(
        padding: const EdgeInsets.all(                                                                      4.0),
        child: Chip(
          backgroundColor: Colors.grey.shade200,
          deleteIconColor: Colors.grey,
          label: Text(tags.name, style: TextStyle(color: offersColor),),
          onDeleted: () {
            setState(() {
              tagss = _category.map((v) => v.name).toList();
              reviewAndSubmit.category.value = tagss;

              _category.removeWhere((CategoryTag entry) {
                return entry.name == tags.name;
              });
            });
          },
        ),
      );
    });
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
      body: Center(
          child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Wrap(children: [
            DetailsInformation(
                "Write a title for what you offer without 'I will' as it is built-in with your words "),
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
                      controller: _IWill,
                      onChanged: (text) {
                        setTitle(title, _IWill.text);
                      },
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
                      maxLength: 70,
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
            Stack(children: [
              Container(
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
                      onChanged: (value){
                        setState(() {
                          reviewAndSubmit.newDiscription.value = value;
                        });
                      },
                        cursorColor: offersColor,
                        maxLines: maxLines,
                        minLines: 5,
                        maxLength: 1500,
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
            ]),
            Divider(
              height: 50,
              thickness: 1,
            ),
            DetailsInformation(
                "Category helps your offer to be in the correct place for the user search"),
            Container(
              height: 5,
            ),
            Text(
              "Please choose a Category tag",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: offersColor)),
                        child: TextField(
                          controller: _controller,
                          cursorColor: offersColor,
                          decoration: InputDecoration(
                              focusColor: offersColor,
                              hoverColor: offersColor,
                              border: InputBorder.none),
                          onChanged: (value) {
                            setState(() {
                              tagss = _category.map((v) => v.name).toList();
                              reviewAndSubmit.category.value = tagss;
                              print(reviewAndSubmit.category.value);

                            });
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if(_category.length==5){
                            setState(() {

                              showAlertDialog(context, "", "Cannot add more than 5 Category tags !", Icon(Icons.error, color: Colors.red,));

                            });
                          }else{
                            setState(() {
                              _category.add(CategoryTag(_controller.text));
                              tagss = _category.map((v) => v.name).toList();
                              tagss = tagss + tempList;
                              reviewAndSubmit.category.value = tagss;
                              _controller.clear();
                            });
                          }
                          print(_category.length);
                        },
                        child: Text("Add"),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(), primary: offersColor),
                      ), Container(margin: EdgeInsets.all(2),padding: EdgeInsets.all(5),child: Text('Example: Programming or Python', style: TextStyle(color: Colors.grey.shade500),)),
                    ],
                  ),
                  Wrap(
                    children: actorWidgets.toList(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
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
              height: 60,
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
                        "You have to provide your customers with at least 5 FAQ that related to your offer. FAQS ADDED CANNOT BE CHANGED LATER",
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
                        setState(() {
                          reviewAndSubmit.faqAnswer.value = faqAnswer;
                          reviewAndSubmit.faqQuestion.value = faqQuestion;



                        });
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
                            faqQuestion.removeLast();
                            faqAnswer.removeLast();
                            reviewAndSubmit.faqAnswer.value = faqAnswer;
                            reviewAndSubmit.faqQuestion.value = faqQuestion;

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
      faqQuestion.add(question.toString());
      faqAnswer.add(answer.toString());
    });
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mainPage(
                                      isFromSettings: false,
                                    )),
                            (Route<dynamic> route) => false,
                          );
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

  putString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  setTitle(x, y) {
    setState(() {
      x = y;
      reviewAndSubmit.newTitle.value = x;
      print(x);
    });
  }
}

class CategoryTag {
  const CategoryTag(this.name);

  final String name;
}
