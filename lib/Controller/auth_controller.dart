import 'dart:convert';
import 'dart:developer';
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
     await SharedPrefrenceData.setUserId(myData['id']);
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
    log("loginRes ==>sponse.body${response.body}");
    var myJsonData = jsonDecode(response.body);
    // ab delete wali krna hai? O
    if (response.statusCode == 200) {
      await SharedPrefrenceData.setToken(myJsonData['token']);
      log("after token ${myJsonData['Data']['id']}");
      await SharedPrefrenceData.setUserId(myJsonData['Data']
          ['id']); // login kro or check kro id save ho rhi ha?
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

  Future deleteAccount(int userId, context) async {
    loading = true;
    notifyListeners();
    var response = await http.post(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.deleteAccountUrl}"),
        body: {
          "user_id": "$userId",
        });
    myToastContext.init(context);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } else {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
    }
    // ho gai hai ab new account register kerna hoga? ok wait
    loading = false;
    notifyListeners();
  }


  Future logout(int? userId) async {
    loading = true;
    notifyListeners();
    var token = SharedPrefrenceData.getToken();
    var response = await http.post(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.logoutUrl}"),
        headers: {
          "Authorization": "Bearer $token"
        },
        body: {
          "user_id": userId,
        });
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
    } else {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
    }
    loading = false;
    notifyListeners();
  }
}
