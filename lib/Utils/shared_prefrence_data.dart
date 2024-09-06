import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceData {
//
  static setToken(String token) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.setString(
      'token',
      token,
    );
  }

//
  static getToken() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    String? token = prefes.getString("token");
    return token;
  }

//
  static setUserId(int userId) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.setInt('user_id', userId);
  }

//
  static getUserId() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    int userId = prefes.getInt('user_id')!;
    return userId;
  }


  
  static setproId(int product_id) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.setInt('product_id', product_id);
  }

//
  static getproId() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    int product_id=  prefes.getInt('product_id')!;
    return product_id;
  }

}
