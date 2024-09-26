import 'package:flutter/material.dart';
import 'package:service_app/Constants/app_colors.dart';

class SaveAddress extends StatefulWidget {
  const SaveAddress({super.key});

  @override
  State<SaveAddress> createState() => _SaveAddressState();
}

class _SaveAddressState extends State<SaveAddress> {
  int? selectedAddressIndex;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedAddressIndex = index;
                    });
                    Navigator.pop(context, selectedAddressIndex);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      color: AppColors.white,
                      border: Border.all(
                        color: selectedAddressIndex == index
                            ? AppColors.lightgreen
                            : AppColors.lightGrey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: height * .20,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddressRowWidget(
                            title: 'House Number :',
                            title1: 'House No 12',
                            width: width,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          AddressRowWidget(
                            title: 'Street Address :',
                            title1: 'Street No 10, Almas village',
                            width: width,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          AddressRowWidget(
                            title: 'Landmark :',
                            title1: '+978457798',
                            width: width,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          AddressRowWidget(
                            title: "john's home :",
                            title1: 'West dubai',
                            width: width,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddressRowWidget extends StatelessWidget {
  final String title;
  final String title1;
  final double width;

  const AddressRowWidget({
    super.key,
    required this.title,
    required this.title1,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: width * 0.09,
        ),
        Text(title1),
      ],
    );
  }
}
