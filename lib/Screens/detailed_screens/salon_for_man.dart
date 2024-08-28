import 'package:flutter/material.dart';
import 'package:service_app/Screens/bottom_nav/uc_screen.dart';

import '../../Constants/App_colors.dart';

class SalonForMan extends StatefulWidget {
  const SalonForMan({super.key});

  @override
  State<SalonForMan> createState() => _SalonForManState();
}

class _SalonForManState extends State<SalonForMan> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/sparow.jpg',
            height: height * 0.2,
          ),
          const Center(
            child: Text(
              'Services you are looking for are \n currently not live in this location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
              'Please change location or explore\n other services on our homepage'),
          SizedBox(
            height: height * 0.04,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UcScreen()));
            },
            child: Container(
              height: height * 0.04,
              width: width * 0.40,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                'Go to homepage',
                style: TextStyle(
                    color: AppColors.purple, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
