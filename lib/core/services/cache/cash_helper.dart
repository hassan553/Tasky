import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  CashHelper._();

  static CashHelper? cashHelper;
  static CashHelper instance() {
    cashHelper ??= CashHelper._();
    return cashHelper!;
  }

  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData(String key) {
    try {
      return sharedPreferences!.get(key);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> setData(String key, dynamic val) async {
    if (key == 'Services') return await setIdsList('service_id', val);
    if (key == 'Gallery') {
      return await sharedPreferences!.setBool('Gallery', true);
    }
    if (val is bool) return await sharedPreferences!.setBool(key, val);
    if (val is double) return await sharedPreferences!.setDouble(key, val);
    if (val is String) {
      return await sharedPreferences!.setString(key, val);
    } else {
      return await sharedPreferences!.setInt(key, val);
    }
  }

  static Future<bool> setIdsList(String idKey, dynamic jsonList) async {
    String ids = '';
    for (Map<String, dynamic> e in jsonList) {
      ids += '${e[idKey]} ';
    }
    return await setData(idKey, ids);
  }

  static List<int> getIdList(String idKey) {
    if (sharedPreferences!.containsKey(idKey)) {
      var response = getData(idKey).toString().trim();
      return response == ""
          ? []
          : response.split(' ').map((e) => int.parse(e)).toList();
    }
    return [];
  }
}
