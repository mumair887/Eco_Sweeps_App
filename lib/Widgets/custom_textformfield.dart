import 'package:flutter/material.dart';
import 'package:service_app/Constants/App_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Color? color;
  final Color? bordercolor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.color,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.bordercolor,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide:
              BorderSide(color: bordercolor ?? AppColors.defaultBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: bordercolor ?? AppColors.lightGrey),
        ),
      ),
    );
  }
}
