import 'package:shared_preferences/shared_preferences.dart';

class SharedModel {
  static SharedPreferences? _preferences;

  static const _keyCategoryId = 'categoryid';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setCategoryId(String categoryid) async =>
      await _preferences?.setString(_keyCategoryId, categoryid);

  static String? getCategoryId() => _preferences?.getString(_keyCategoryId);

}