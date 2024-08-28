import 'package:flutter/material.dart';
import 'package:service_app/Screens/detailed_screens/laundry_screens/laundry_detail_screen.dart';
import 'package:service_app/Widgets/container_widget.dart';

import '../../../Constants/App_colors.dart';

class ChefCategoryScreen extends StatefulWidget {
  const ChefCategoryScreen({super.key});

  @override
  State<ChefCategoryScreen> createState() => _ChefCategoryScreenState();
}

class _ChefCategoryScreenState extends State<ChefCategoryScreen> {
  List wo = [
    'assets/che1.jpg',
    'assets/che2.jpg',
    'assets/che3.jpg',
    'assets/che4.jpg',
    'assets/che5.jpg',
    'assets/che6.jpg',
  ];
  List wodetail = [
    "Personal Chef Services",
    "Private Dinner Parties",
    'Catering Services',
    'Nutritional & Dietary Plan',
    'Specialty Cuisine Services',
    'Holiday & Seasonal Cook',
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chef Services',
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
                itemCount: 6,
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
                                  : index == 3
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LaundryDetailScreen()))
                                      : index == 4
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LaundryDetailScreen()))
                                          : index == 5
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LaundryDetailScreen()))
                                              : index == 6
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
