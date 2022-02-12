import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "TOKEN";
  final SharedPreferences prefs;

  SharedPreferenceHelper({required this.prefs});

  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
  }

  String? getUserToken() {
    final userToken = prefs.getString(token);
    return userToken;
  }
}
