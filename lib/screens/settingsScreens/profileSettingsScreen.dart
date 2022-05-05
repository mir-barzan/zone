import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zone/screens/settingsScreens/personalSettingsScreen.dart';
import 'package:zone/screens/settingsScreens/portfolioScreen.dart';
import 'package:zone/screens/settingsScreens/securityScreens.dart';
import 'package:zone/widgets/text_field_input.dart';
//TODO: Configure backend
import '../../additional/colors.dart';
import '../../widgets/AdditionalWidgets.dart';
import 'aboutUsScreen.dart';
import 'helpScreen.dart';

class profileSettingsScreen extends StatefulWidget {
  const profileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<profileSettingsScreen> createState() => _profileSettingsScreenState();
}

class _profileSettingsScreenState extends State<profileSettingsScreen> {
  @override
  final TextEditingController _skill1 = TextEditingController();
  final TextEditingController _skill2 = TextEditingController();
  final TextEditingController _skill3 = TextEditingController();
  final TextEditingController _skill4 = TextEditingController();
  final TextEditingController _skill5 = TextEditingController();
  final TextEditingController _aboutMe = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Profile Settings',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Change Profile Picture",
                style: TextStyle(
                    color: secColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/zone-b3608.appspot.com/o/profileAvatar.png?alt=media&token=19b38fea-2248-4e61-a886-13d4f4a27caa'),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.upload_sharp,
                            color: secColor,
                          )))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 18,
            ),
            MaterialButton(
              height: 24,
              child: Text("Change Skills", style: TextStyle(color: secColor, fontSize: 18, fontWeight: FontWeight.bold),),
              onPressed: () {

    showDialog(context: context, builder: (BuildContext context) => errorDialog(context,widget, _skill1,_skill2,_skill3,_skill4,_skill5));
              },
            ),
            SizedBox(
              height: 18,
            ),
            Divider(),
            SizedBox(height: 18,),
            Center(
              child: Text(
                "About me",
                style: TextStyle(
                    color: secColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            TextField(maxLines: 3,maxLength: 120,controller: _aboutMe,),
            SizedBox(height: 18,),
            TextButton(onPressed: () {
              navigatePop(context, widget);
            },
                child: Text('Sumbit Changes!',
                  style: TextStyle(color: Colors.green, fontSize: 18.0),))

          ],
        ),
      ),
    );
  }
}
Dialog errorDialog(context, widget, TextEditingController skill1,TextEditingController skill2,TextEditingController skill3,TextEditingController skill4,TextEditingController skill5) {

  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    //this right here
    child: ListView(
      children:[ Padding(
        child: Container(
          height: 450.0,
          width: 300.0,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 10,),
              Text('Skill 1', style: TextStyle(color: secColor),),
              TextFieldInput(textEditingController: skill1, hintText: "Please enter skill 1", textInputType: TextInputType.text),
              SizedBox(height: 10,),

              Text('Skill 2', style: TextStyle(color: secColor),),
              TextFieldInput(textEditingController: skill2, hintText: "Please enter skill 2", textInputType: TextInputType.text),
              SizedBox(height: 10,),

              Text('Skill 3', style: TextStyle(color: secColor),),
              TextFieldInput(textEditingController: skill3, hintText: "Please enter skill 3", textInputType: TextInputType.text),

              SizedBox(height: 10,),

              Text('Skill 4', style: TextStyle(color: secColor),),
              TextFieldInput(textEditingController: skill4, hintText: "Please enter skill 4", textInputType: TextInputType.text),

              SizedBox(height: 10,),

              Text('Skill 5', style: TextStyle(color: secColor),),
              TextFieldInput(textEditingController: skill5, hintText: "Please enter skill 5", textInputType: TextInputType.text),

              SizedBox(height: 10,),



              Padding(padding: EdgeInsets.only(top: 10.0)),
              TextButton(onPressed: () {
                navigatePop(context, widget);
              },
                  child: Text('Sumbit!',
                    style: TextStyle(color: Colors.green, fontSize: 18.0),))
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
      )],
    ),
  );
}