import 'package:flutter/material.dart';
import 'package:service_app/Controller/cart_controller.dart';
import 'package:service_app/Widgets/custome_container/custom_container.dart';
import '../../Constants/App_colors.dart';
import '../../Widgets/container_widget.dart';
import '../../Widgets/round_button_widget.dart';
import '../Address/address_detail.dart';

class CartScreen extends StatefulWidget {


  CartScreen({super.key});





  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = CartController();
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
              child: FutureBuilder(
                future: cartController.getViewMyCart(68),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.cartItems!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: CustomContainer(
                          title: snapshot.data!.cartItems![index].productName
                              .toString(),
                          image: 'assets/w2.jpg',
                          price: snapshot.data!.cartItems![index].totalPrice
                              .toString(),
                        ),
                      );
                    },
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
