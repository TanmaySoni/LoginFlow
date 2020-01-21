import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPreferences prefs;

  static setIsLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<bool> getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn');
  }

  static setUid(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('uid', uid);
  }

  static Future<bool> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('uid');
  }
}
