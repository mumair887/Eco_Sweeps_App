// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:service_app/Constants/App_colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Color? color;
  final Color? bordercolor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String?)? onSaved;
  Function(String)? onFieldSubmitted;
  final TextEditingController? controller;

  Function(String)? onChanged;

  CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.color,
    this.bordercolor,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
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
          borderSide:
              BorderSide(color: bordercolor ?? AppColors.defaultBorderColor),
        ),
      ),
    );
  }
}
