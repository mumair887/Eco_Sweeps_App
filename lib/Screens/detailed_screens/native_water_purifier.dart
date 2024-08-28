import 'package:flutter/material.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../Constants/App_colors.dart';

class NativeWaterPurifier extends StatelessWidget {
  const NativeWaterPurifier({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Runing AD',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Center(
            child: RoundButtonWidget(
                title: 'Buy now', buttonColor: AppColors.blue, onpress: () {}),
          )
        ],
      ),
    );
  }
}
