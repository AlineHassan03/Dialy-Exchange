import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getSaveData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is List) {
      return await sharedPreferences!.setStringList(key, List.from(value));
    }
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future remove(String key) async {
    sharedPreferences!.remove(key);
  }
}
