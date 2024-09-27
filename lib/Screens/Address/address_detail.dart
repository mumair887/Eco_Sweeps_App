import 'package:flutter/material.dart';
import 'package:service_app/Controller/address_controller.dart';
import 'package:service_app/Models/get_adress.dart';
import 'package:service_app/Screens/Save_Address/save_address.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import 'package:service_app/Widgets/container_widget.dart';
import 'package:service_app/Widgets/custom_textformfield.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../../Constants/App_colors.dart';
import '../../../Models/address_model.dart';

class BookAddressDetail extends StatefulWidget {
  const BookAddressDetail({super.key});

  @override
  State<BookAddressDetail> createState() => _BookAddressDetailState();
}

class _BookAddressDetailState extends State<BookAddressDetail> {
  TextEditingController houseno = TextEditingController();
  TextEditingController addresshouse = TextEditingController();
  TextEditingController addresdetail = TextEditingController();
  TextEditingController landmarks = TextEditingController();
  TextEditingController usersId = TextEditingController();
  String selectedType = ''; // Track selected container

  void _updateSelection(String type) {
    setState(() {
      selectedType = type;
    });
  }

  bool isopen = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? userId;
  String? latitude;
  String? longitude;
  String? address;
  String? houseNo;
  String? addressDetail;
  String? landmark;

  void submitAddress() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AddressModel? result = await AddressController().postAddress(
        houseno.text.toString(),
        address.toString(),
        addresdetail.text,
        landmarks.text,
        await SharedPrefrenceData.getUserId(),
      );

      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Address posted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to post address.')),
        );
      }
    }
  }

  Address? selectedAddress;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Your Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // Navigate to the address selection screen and await the result
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SaveAddress()),
                        );

                        // If a result is returned, update the selected address
                        if (result is Address) {
                          setState(() {
                            selectedAddress = result;
                          });
                        }
                      },
                      child: const Text('Select Address'),
                    ),
                  ],
                ),
                Divider(thickness: 3, color: AppColors.lightGrey),
                const SizedBox(
                  height: 10,
                ),
                // Display the selected address if available
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Text(
                      selectedAddress != null
                          ? 'Selected Address: ${selectedAddress!.address}\nHouse No: ${selectedAddress!.houseNo}\nLandmark: ${selectedAddress!.landmark ?? "N/A"}'
                          : 'No Address Selected',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Button to navigate to the address selection screen
                const SizedBox(
                  height: 10,
                ),

                Align(
                  heightFactor: 8,
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: RoundButtonWidget(
                      buttonColor: AppColors.lightgreen,
                      title: 'Save and Process',
                      onpress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ContainerWidget(
                              height: height * .5,
                              width: width,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(children: [
                                  const Text(
                                    'Payment Summary',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(' payment:'),
                                      Text('Rs. 100')
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [Text(' Fee:'), Text('Rs. 30')],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Divider(
                                      thickness: 3, color: AppColors.lightGrey),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total payable:'),
                                      Text('Rs. 130')
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                  ),
                                  const Text(
                                    'Pay via:',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: height * 0.09,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/meezan.jpg'),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height: height * 0.09,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/dub bank.jpg'),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height: height * 0.09,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/jazz.png'),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  RoundButtonWidget(
                                    title: 'CheckOut',
                                    onpress: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        showDragHandle: true,
                                        context: context,
                                        builder: (context) {
                                          return ContainerWidget(
                                            height: height * .8,
                                            width: width,
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Continue Payment',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: const Icon(
                                                              Icons.close))
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ContainerWidget(
                                                        height: height * 0.035,
                                                        width: width * 0.12,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: const DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/visa.png'),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.02,
                                                      ),
                                                      ContainerWidget(
                                                        height: height * 0.035,
                                                        width: width * 0.12,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: const DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/master.png'),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.02,
                                                      ),
                                                      ContainerWidget(
                                                        height: height * 0.035,
                                                        width: width * 0.12,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: const DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/jcb.jpg'),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.02,
                                                      ),
                                                      ContainerWidget(
                                                        height: height * 0.035,
                                                        width: width * 0.12,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: const DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/pay.png'),
                                                              fit:
                                                                  BoxFit.cover),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  CustomTextFormField(
                                                    bordercolor:
                                                        AppColors.black,
                                                    hintText: 'Card Number',
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  CustomTextFormField(
                                                    bordercolor:
                                                        AppColors.black,
                                                    hintText: 'Cardholder Name',
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  CustomTextFormField(
                                                    bordercolor:
                                                        AppColors.black,
                                                    hintText: 'MM/YY',
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.03,
                                                  ),
                                                  CustomTextFormField(
                                                    bordercolor:
                                                        AppColors.black,
                                                    suffixIcon: Icons
                                                        .question_mark_outlined,
                                                    hintText: 'CVV',
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Icon(Icons.error_outline),
                                                      Text(
                                                        'Your order will be processed in PKR',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.08,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'PKR Rs. 1500',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Call the function to show the success dialog
                                                          _showBookingSuccessDialog(
                                                              context);
                                                        },
                                                        child: ContainerWidget(
                                                          height:
                                                              height * 0.065,
                                                          width: width * 0.35,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .lightgreen,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: const Center(
                                                            child: Text(
                                                              'Pay Now',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    buttonColor: AppColors.lightgreen,
                                  )
                                ]),
                              ),
                            );
                          },
                        );

                        submitAddress();

                        ///------------------------bank detail start---------------------------////
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////-------------------alert dialoge box widget-------------------////
void _showBookingSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Booking Successful'),
        content: const Text('Your booking has been processed successfully.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.pushNamedAndRemoveUntil(
                  context, 'navbar', (route) => false);
              // Close the dialog
              // Navigate to the home screen, replace `HomeScreen` with your home screen widget
            },
          ),
        ],
      );
    },
  );
}
