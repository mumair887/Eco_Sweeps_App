import 'package:flutter/material.dart';
import 'package:service_app/Screens/Address/address_detail.dart';
import 'package:service_app/Widgets/custome_container/custom_container.dart';

import '../../Constants/app_colors.dart';
import '../../Widgets/container_widget.dart';
import '../../Widgets/round_button_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Replace with your actual item count
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: CustomContainer(
                      title: 'Soil 50 Liters', // Replace with dynamic data
                      image: 'assets/w2.jpg', // Replace with dynamic data
                      price: '300.00 AED', // Replace with dynamic data
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * 0.9,
                height: height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.orangeAccent.shade100,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Total Amount'),
                      Spacer(),
                      Text(
                        '1143.33 AED',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text(' payment:'), Text('Rs. 100')],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text(' Fee:'), Text('Rs. 30')],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Divider(thickness: 3, color: AppColors.lightGrey),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/meezan.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/dub bank.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage('assets/jazz.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            RoundButtonWidget(
                              title: 'CheckOut',
                              onpress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BookAddressDetail()));
                              },
                              buttonColor: AppColors.lightgreen,
                            )
                          ]),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: width * 0.9,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Proceed To Shipping',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
