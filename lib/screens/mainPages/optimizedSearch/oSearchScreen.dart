import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/optimizedSearch/requirements.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
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
          child: ListView(
            children: [
              Container(
                height: 58,
              ),
              //TODO: illustrate a well look design explanation about this page
              Container(
                height: 300,
                color: offersColor,
                child: Center(child: Text('here')),
              ),
              Container(
                height: 130,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      navigateTo(context, requirements());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          child: Center(
                              child: Text(
                            "Let's do it",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          )),
                          decoration: BoxDecoration(
                              color: offersColor,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        navigateTo(context, requirements());
                      },
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        size: 35,
                        color: offersColor,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
