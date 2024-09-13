import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Utils/toast_component.dart';

class ProfileController extends ChangeNotifier {
  bool loading = false;
  //EditProfile

  Future<void> editprofile(int userId) async {
    try {
      loading = true;
      notifyListeners();
      var response = await http.post(
          Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.editprofile}"),
          body: {
            'userid': '$userId',
          });
      var jsonData = jsonDecode(response.body);
      // return response;
      if (response.statusCode == 200) {
        log(response.body);
        Utills.showDialogSuccess("${jsonData['message']}");
      } else {
        Utills.showDialogError("${jsonData['messae']}");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  //update profile controller
  Future<void> UpdateProfile(
      String name, String email, String password, String userId) async {
    try {
      loading = true;
      notifyListeners();
      var response = await http.post(
          Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.updateprofile}"),
          body: {
            'name': name,
            'email': email,
            'password': password,
            'user_id': userId,
          });
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log(response.body);
        Utills.showDialogSuccess("${jsonData['message']}");
      } else {
        Utills.showDialogError("${jsonData['message']}");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
