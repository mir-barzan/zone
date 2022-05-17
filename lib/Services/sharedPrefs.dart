
import 'package:shared_preferences/shared_preferences.dart';

class sharedprefs{
  static SharedPreferences? _preferences;

  static const _keyoftitle = "Hope";

  static Future init() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance() as SharedPreferences;
  }

  static Future setTitle(String title) async {
    await _preferences?.setString(_keyoftitle, title);
  }
  static String getTitle() {
   return _preferences?.getString(_keyoftitle) ?? "";
  }
  static Future setData(String key,String title) async {
    await _preferences?.setString(key, title);
  }
}