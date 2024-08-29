import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Auth/otp_verification_screen.dart';
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Screens/bottom_nav/bottom_navbar.dart';
import 'package:service_app/Screens/bottom_nav/uc_screen.dart';
import 'package:service_app/Utils/toast_component.dart';

class AuthController {
  bool loading = false;
// setToken() async {
//     SharedPreferences prefes = await SharedPreferences.getInstance();
//     prefes.setString('token', myName);
//   }

//   getToken() async {
//     SharedPreferences prefes = await SharedPreferences.getInstance();
//     token = prefes.getString("token");
//     log("MyName ==> $token");
//   }

  Future signUp(String name, String email, String phoneNumber, String password,
      context) async {
    try {
      loading = true;
      ChangeNotifier();
      var response = await http
          .post(Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.signup}"), body: {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
      });
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const OtpVerificationScreen()));
        Get.snackbar('Eco Sweeps', 'Put OTP ', backgroundColor: Colors.green);
        log(response.body.toString());
      } else {
        Get.snackbar('Eco Sweeps', 'Add required data',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      ToastComponent.showDialog("$e");
    } finally {
      loading = false;
      ChangeNotifier();
    }
  }
//---------------Login api fucntion code start ------------------------///

  Future signIn(String email, String password, context) async {
    try {
      loading = true;
      ChangeNotifier();
      var response = await http
          .post(Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.login}"), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNavbar()));
        Get.snackbar('Eco Sweeps', 'Logged in sucessfully',
            backgroundColor: Colors.green);
      } else {
        Get.snackbar('Eco Sweeps', 'email or password wrong',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Eco Sweeps', e.toString(), backgroundColor: Colors.red);
    } finally {
      loading = false;
    }
  }

//---------------sign up with code fucntion code start ------------------------///
  Future signUpwithCode(String verificationCode, context) async {
    try {
      loading = true;
      var response = await http.post(
          Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.signupwithcode}"),
          body: {
            "verification_code": verificationCode,
          });
      if (response.statusCode == 200) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNavbar()));
        Get.snackbar('Eco Sweeps', 'User Registerd sucessfully',
            backgroundColor: Colors.green);
      } else {
        Get.snackbar('Eco Sweeps', 'Wrong OTP');
      }
    } catch (e) {
      ToastComponent.showDialog("$e");
    } finally {
      loading = false;
    }
  }
//
}
