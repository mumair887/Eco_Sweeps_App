import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceData {
  static setToken(String token) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.setString(
      'token',
      token,
    );
  }

  static getToken() async {
    String? token;
    SharedPreferences prefes = await SharedPreferences.getInstance();
    token = prefes.getString("token");
    return token;
  }
}
