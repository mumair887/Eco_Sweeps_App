import 'package:flutter/material.dart';
import 'package:service_app/Screens/detailed_screens/laundry_screens/laundry_detail_screen.dart';
import 'package:service_app/Widgets/container_widget.dart';

import '../../../Constants/App_colors.dart';

class LoadingVehiclecategoryScreen extends StatefulWidget {
  const LoadingVehiclecategoryScreen({super.key});

  @override
  State<LoadingVehiclecategoryScreen> createState() =>
      _LoadingVehiclecategoryScreenState();
}

class _LoadingVehiclecategoryScreenState
    extends State<LoadingVehiclecategoryScreen> {
  List wo = [
    'assets/heavy.jpg',
    'assets/homeserv.jpg',
    'assets/book.jpg',
  ];
  List wodetail = [
    "Heavy lift Service",
    'Building Material Supply ',
    "Outbond from Dubai",
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pest Control Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(thickness: 3, color: AppColors.lightGrey),
              SizedBox(
                height: height * 0.03,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      index == 0
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LaundryDetailScreen()))
                          : index == 1
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LaundryDetailScreen()))
                              : index == 2
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LaundryDetailScreen()))
                                  : null;
                    },
                    child: ContainerWidget(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: height * .14,
                      width: width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.1), // Shadow color with opacity
                              offset: const Offset(
                                  0, 2), // Horizontal and vertical offset
                              blurRadius: 2, // Blur radius
                              spreadRadius: 0.5, // Spread radius
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: AppColors.white)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: height * 0.10,
                              width: width * 0.20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(wo[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              wodetail[index],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
