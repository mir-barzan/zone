import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone/Services/changeScreenProvider.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/addOfferMain/addOfferScreen.dart';
import 'package:zone/screens/mainPages/addOfferMain/imageAndConfigure.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/main_page.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import 'package:zone/widgets/text_field_input.dart';
import './editreviewAndSubmit.dart';

class editinformationScreen extends StatefulWidget {
  final offerId;

  const editinformationScreen({Key? key, required this.offerId})
      : super(key: key);

  @override
  State<editinformationScreen> createState() => editinformationScreenState();
}

class editinformationScreenState extends State<editinformationScreen>
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

  var offerData = {};

  getData() async {
    var snap = await FirebaseFirestore.instance
        .collection('Category')
        .doc(widget.offerId)
        .get();
    offerData = snap.data()!;
    setState(() {
      _IWill.text = offerData['title'].toString();
      _Details.text = offerData['description'].toString();
      tagss = offerData['categoryTags'];
      print(tagss);
      faqQuestion = offerData['faqQuestion'];
      faqAnswer = offerData['faqAnswer'];
      print(faqQuestion);
      print(faqAnswer);
      editreviewAndSubmit.newTitle.value = offerData['title'].toString();
      editreviewAndSubmit.newDiscription.value =
          offerData['description'].toString();
      editreviewAndSubmit.newPrice.value = offerData['price'].toString();
      editreviewAndSubmit.category.value = offerData['categoryTags'];
      editreviewAndSubmit.oldPhotoUrl.value = offerData['PhotoUrl'].toString();
    });
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

  createQuestionAndAnswer(String question, String answer) {
    questions2.add(ExpansionTileCard(
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

    setState(() {});
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

  @override
  void initState() {
    // TODO: implement initState
    getData();
    assignQuestion();
    super.initState();
  }

  final List<CategoryTag> _category = <CategoryTag>[];
  List tagss = [];
  List faqQuestion = [];
  List faqAnswer = [];
  List<ExpansionTileCard> questions2 = [];

  Iterable<Widget> get actorWidgets {
    return _category.map((CategoryTag tags) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Chip(
          backgroundColor: Colors.grey.shade200,
          deleteIconColor: Colors.grey,
          label: Text(
            tags.name,
            style: TextStyle(color: offersColor),
          ),
          onDeleted: () {
            setState(() {
              tagss = _category.map((v) => v.name).toList();
              editreviewAndSubmit.category.value = tagss;

              _category.removeWhere((CategoryTag entry) {
                return entry.name == tags.name;
              });
            });
          },
        ),
      );
    });
  }

  assignQuestion() {
    for (int i = 0; i < faqQuestion!.length; i++) {
      createQuestionAndAnswer(
          faqQuestion!.elementAt(i), faqAnswer!.elementAt(i));
    }
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
                        controller: _Details,
                        onChanged: (value) {
                          setState(() {
                            editreviewAndSubmit.newDiscription.value = value;
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
                              editreviewAndSubmit.category.value = tagss;
                              print(editreviewAndSubmit.category.value);
                            });
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (tagss.length >= 5) {
                            setState(() {
                              showAlertDialog(
                                  context,
                                  "",
                                  "Cannot add more than 5 Category tags !",
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ));
                            });
                          } else {
                            setState(() {
                              tagss.add(_controller.text);
                              editreviewAndSubmit.category.value = tagss;
                              _controller.clear();
                            });
                          }
                          print(_category.length);
                        },
                        child: Text("Add"),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(), primary: offersColor),
                      ),
                      Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Example: Programming or Python',
                            style: TextStyle(color: Colors.grey.shade500),
                          )),
                    ],
                  ),
                  Wrap(spacing: 25, children: [
                    for (var i in tagss)
                      (Chip(
                        label: Text(i.toString()),
                        onDeleted: () {
                          setState(() {
                            tagss.removeWhere((element) =>
                                element.toString() == i.toString());
                            editreviewAndSubmit.category.value = tagss;
                          });
                        },
                        backgroundColor: Colors.grey.shade200,
                        deleteIconColor: Colors.grey,
                      ))
                  ])
                ],
              ),
            ),
            const SizedBox(height: 30),
            Divider(
              height: 50,
              thickness: 0,
            ),
          ])
        ],
      )),
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
      editreviewAndSubmit.newTitle.value = x;
      print(x);
    });
  }
}

class CategoryTag {
  const CategoryTag(this.name);

  final String name;
}
