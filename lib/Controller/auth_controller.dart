import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Auth/otp_verification_screen.dart';
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Screens/bottom_nav/uc_screen.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import 'package:service_app/Utils/toast_component.dart';
import 'package:toast/toast.dart';

class AuthController extends ChangeNotifier {
//
  bool loading = false;
  ToastContext myToastContext = ToastContext();
//

  Future signUp(String name, String email, String phoneNumber, String password,
      context) async {
    loading = true;
    notifyListeners();
    var response = await http
        .post(Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.signup}"), body: {
      "name": name,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
    });
    var myData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loading = false;
      notifyListeners();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const OtpVerificationScreen()));
      Get.snackbar('Eco Sweeps', 'Put OTP ', backgroundColor: Colors.green);
    } else {
      loading = false;
      notifyListeners();
      myToastContext.init(context);
      ToastComponent.showDialogError("${myData['message']}",
          gravity: Toast.top);
    }
  }

//---------------Login api fucntion code start ------------------------///

  Future signIn(String email, String password, context) async {
    loading = true;
    notifyListeners();
    var response = await http
        .post(Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.login}"), body: {
      "email": email,
      "password": password,
    });
    var myJsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SharedPrefrenceData.setToken(myJsonData['token']);
      loading = false;
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const UcScreen()));
      Get.snackbar('Eco Sweeps', 'Logged in sucessfully',
          backgroundColor: Colors.green);
    } else {
      loading = false;
      notifyListeners();
      ToastComponent.showDialogError("${myJsonData['message']}");
    }
  }

//---------------sign up with code fucntion code start ------------------------///
  Future signUpwithCode(String verificationCode, context) async {
    loading = true;
    notifyListeners();
    var response = await http.post(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.signupwithcode}"),
        body: {
          "verification_code": verificationCode,
        });
    var myJosnData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loading = false;
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const UcScreen()));
      Get.snackbar('Eco Sweeps', 'User Registerd sucessfully',
          backgroundColor: Colors.green);
    } else {
      loading = false;
      notifyListeners();
      ToastComponent.showDialogError("${myJosnData['message']}");
    }
  }

//
}
