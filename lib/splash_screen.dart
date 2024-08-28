import 'dart:async';

import 'package:flutter/material.dart';
import 'package:service_app/Auth/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,  
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: const Color(0xff7db901),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.cover,
                height: height * .3,
                width: width * .6,
              ),
            ),
          ],
        ));
  }
}
