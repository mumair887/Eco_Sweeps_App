import 'package:flutter/material.dart';
import 'package:service_app/Constants/app_colors.dart';
import 'package:toast/toast.dart';

class ToastComponent {
  static showDialog(String msg, {duration = 0, gravity = 0}) {
    Toast.show(msg,
        duration: duration != 0 ? duration : Toast.lengthShort,
        gravity: gravity != 0 ? gravity : Toast.bottom,
        backgroundColor: const Color.fromRGBO(239, 239, 239, .9),
        textStyle: TextStyle(color: AppColors.grey),
        border: const Border(
            top: BorderSide(
              color: Color.fromRGBO(203, 209, 209, 1),
            ),
            bottom: BorderSide(
              color: Color.fromRGBO(203, 209, 209, 1),
            ),
            right: BorderSide(
              color: Color.fromRGBO(203, 209, 209, 1),
            ),
            left: BorderSide(
              color: Color.fromRGBO(68, 243, 243, 1),
            )),
        backgroundRadius: 6);
  }
}
