import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class personalSettingsScreen extends StatefulWidget {
  const personalSettingsScreen({Key? key}) : super(key: key);

  @override
  State<personalSettingsScreen> createState() => _personalSettingsScreenState();
}

class _personalSettingsScreenState extends State<personalSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: secColor,
        ),
        title: Text(
          'Personal Settings',
          style: TextStyle(color: secColor),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),

                settingButton2("Name", "   AbdallahAlsaifi", context, widget),
                Divider(),
                settingButton2("Name:", "   AbdallahAlsaifi", context, widget),Divider(),
                settingButton2("Email:", "   Abdallah.@gmail.com", context, widget),Divider(),
                settingButton2("Phone Number:", "   05338548187", context, widget),Divider(),
                settingButton2("Security Question:", "   ...", context, widget),
              ],
            )),
      ),
    );
  }
}
