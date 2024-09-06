import 'package:flutter/material.dart';
import 'package:service_app/Constants/App_colors.dart';
import 'package:service_app/Widgets/custom_textformfield.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            CustomTextFormField(
              controller: namecontroller,
              hintText: 'Full Name',
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextFormField(
              controller: emailcontroller,
              hintText: 'Email Address',
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextFormField(
              controller: phonecontroller,
              hintText: 'Phone Number',
            ),
            SizedBox(
              height: height * 0.05,
            ),
            RoundButtonWidget(
              title: 'Update Now',
              onpress: () {},
              buttonColor: AppColors.lightgreen,
            )
          ],
        ),
      ),
    );
  }
}
