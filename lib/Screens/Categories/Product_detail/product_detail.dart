import 'package:flutter/material.dart';
import 'package:service_app/Controller/product_controller.dart';
import 'package:http/http.dart' as http;

import '../../../Constants/app_colors.dart';
import '../../../Widgets/round_button_widget.dart';
import '../../Cart/cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<int> quantities = List.filled(6, 0);
  List<bool> isAddedToCart = List.filled(6, false);

  int _count = 0;
  void increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          FutureBuilder(
              future: productController.postProductDetails(4),
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   // return const Center(
                //   //   child: CircularProgressIndicator(),
                //   // );
                // }

                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setModalState) {
                    return Container(
                      height: height * 0.85,
                      width: width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.19,
                                width: width,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/homeserv.jpg'),
                                        fit: BoxFit.cover),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'jhgkhkjh'
                                // snapshot.data!.Data!.description.toString(),
                                ,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Any hourly electrician service you need. Light bulb\nchanges, spotlight fixes, electrical issues solutions.',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text(
                                    'AED 149',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'AED 169',
                                    style: TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(height: 10),
                              const Text(
                                "What's Included",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: height * 0.030),
                              const Text(
                                  'You have the flexibility to schedule an hourly handyman\nservices such as:'),
                              SizedBox(height: height * 0.030),
                              const Text(
                                  'Furniture installation.\nTv installation\nCurtain hanging\nDrilling\nDoor installation and repair'),
                              SizedBox(height: height * 0.030),
                              const Text(
                                'Charges',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'A visit charge of AED 129 is applicable, covering the first\nhour of work(excluding materials cost)A fee of AED 65 will be charged for every additional 30\nminutes of service after the first hour.\nCanceling the booking within 2 hours of the appointment\nstart time will incur a 30-minute service fee.\nIf a client needs a quote for additional work but decides\nnot to proceed, a 50% visit charge is applied.\nA 30-minute charge will apply if the service is not\nutilized',
                              ),
                              SizedBox(height: height * 0.020),
                              const Text(
                                'Materials',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Additional materials required, such as fittings or cables,\nwill be subject to separate charges, excluding the\nbooking amount.\nhe procurement of materials is subject to local market\navailability and may take 2-3 days.\nIf the parts are not available, the booking amount will not\nbe refunded.',
                              ),
                              SizedBox(height: height * 0.03),
                              const Text(
                                'Permits & Cancellation',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Sundays and Public Holidays: Permits must be arranged by\nthe customers, especially for drilling holes\nMonday to Saturday after 5pm: Permission should be\narranged by the customers.\nFull property access is required for all jobs. The service fee\nis non-refundable if the professional is unable to proceed\ndue to permit issues.\nCanceling your booking within 2 hours before the\nappointment start time will incur a charge of 50% of the\ntotal booking value.',
                              ),
                              const SizedBox(height: 39),
                              Container(
                                height: height * 0.2,
                                width: width,
                                decoration: const BoxDecoration(
                                  color: Colors.white10,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 20,
                                        blurRadius: 20),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: IconButton(
                                              icon: const Center(
                                                  child: Icon(Icons.remove)),
                                              onPressed: () {
                                                setModalState(() {
                                                  if (_count > 0) {
                                                    _count--;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Text(
                                            '$_count',
                                            style:
                                                const TextStyle(fontSize: 32),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.green,
                                            child: IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                setModalState(() {
                                                  _count++;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    Center(
                                      child: RoundButtonWidget(
                                          buttonColor: AppColors.lightgreen,
                                          title: 'Add  to Cart for AED 130',
                                          onpress: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CartScreen()));
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
        ]));
  }
}
