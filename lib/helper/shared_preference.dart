import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static String sharedPreferenceUser = "USERNAME";

  static Future<String?> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceUser);
  }

  static Future<bool> clearUserInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(sharedPreferenceUser);
  }

  static Future<void> saveUserInfoToSharedPrefs(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPreferenceUser, userName);
  }
}
