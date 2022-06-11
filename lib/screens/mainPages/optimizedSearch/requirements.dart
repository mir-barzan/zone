import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/screens/mainPages/optimizedSearch/secondRequirements.dart';

import '../../../additional/colors.dart';
import '../../../widgets/AdditionalWidgets.dart';

class requirements extends StatefulWidget {
  const requirements({Key? key}) : super(key: key);

  @override
  State<requirements> createState() => _requirementsState();
}

class _requirementsState extends State<requirements> {
  TextEditingController _controller = TextEditingController();

  List<String> tagss = [];
  final List<CategoryTag> _category = <CategoryTag>[];

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
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          'First, you need to fill in your requirements in a single line.',
                          maxLines: 2,
                          style: TextStyle(fontSize: 19, color: primaryColor),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: offersColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: TextField(
                              onChanged: (text) {},
                              cursorColor: offersColor,
                              obscureText: false,
                              decoration: InputDecoration(
                                fillColor: offersColor,
                                hintText: "Describe your requirements",
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
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Then, choose category tags.',
                      maxLines: 2,
                      style: TextStyle(fontSize: 19, color: primaryColor),
                    ),
                    decoration: BoxDecoration(
                        color: offersColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
              Container(
                height: 40,
              ),
              Icon(
                Icons.arrow_downward,
                color: offersColor,
                size: 50,
              ),
              Container(
                height: 30,
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
                            //TODO: add a controller to this text field
                            cursorColor: offersColor,
                            decoration: InputDecoration(
                                focusColor: offersColor,
                                hoverColor: offersColor,
                                border: InputBorder.none),
                            onChanged: (value) {
                              setState(() {
                                tagss = _category.map((v) => v.name).toList();
                              });
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_category.length == 5) {
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
                                _category.add(CategoryTag(_controller.text));
                                tagss = _category.map((v) => v.name).toList();
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
                    Wrap(
                      children: actorWidgets.toList(),
                    )
                  ],
                ),
              ),
              Container(
                height: 55,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, secondRequirements());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Next Step",
                            maxLines: 2,
                            style: TextStyle(fontSize: 19, color: primaryColor),
                          ),
                          decoration: BoxDecoration(
                              color: offersColor,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: offersColor,
                      size: 50,
                    ),
                  ],
                ),
              ),
            ])));
  }
}

class CategoryTag {
  const CategoryTag(this.name);

  final String name;
}
