import 'package:flutter/material.dart';
import 'package:service_app/Controller/product_controller.dart';
import 'package:service_app/Widgets/container_widget.dart';
import 'package:service_app/Widgets/listview_widget.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../../Constants/App_colors.dart';
import '../../Cart/cart_screen.dart';

class LaundryDetailScreen extends StatefulWidget {
  final int? categoryId;
  final int? subcatId;
  final String? name;
  const LaundryDetailScreen(
      {super.key,
      required this.categoryId,
      required this.subcatId,
      required this.name});

  @override
  State<LaundryDetailScreen> createState() => _LaundryDetailScreenState();
}

class _LaundryDetailScreenState extends State<LaundryDetailScreen> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.name!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2, color: AppColors.lightGrey),
              SizedBox(
                height: height * 0.02,
              ),
              
              //------------------listview builder widget start---------------------///

              FutureBuilder(
                  future: productController.getProducts(
                      catId: widget.categoryId, subCatId: widget.subcatId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      child: ListviewWidget(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              snapshot.data!.subCategory!.products!.length,
                          decoration: const BoxDecoration(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //---------------------------details bottom modal sheet start-----------------------///
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setModalState) {
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: height * 0.19,
                                                    width: width,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/homeserv.jpg'),
                                                            fit: BoxFit.cover),
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20))),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  const Text(
                                                    'Hourly Electrician',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  const Text(
                                                    'Any hourly electrician service you need. Light bulb\nchanges, spotlight fixes, electrical issues solutions.',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  const Row(
                                                    children: [
                                                      Text(
                                                        'AED 149',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'AED 169',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
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
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.030),
                                                  const Text(
                                                      'You have the flexibility to schedule an hourly handyman\nservices such as:'),
                                                  SizedBox(
                                                      height: height * 0.030),
                                                  const Text(
                                                      'Furniture installation.\nTv installation\nCurtain hanging\nDrilling\nDoor installation and repair'),
                                                  SizedBox(
                                                      height: height * 0.030),
                                                  const Text(
                                                    'Charges',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Text(
                                                    'A visit charge of AED 129 is applicable, covering the first\nhour of work(excluding materials cost)A fee of AED 65 will be charged for every additional 30\nminutes of service after the first hour.\nCanceling the booking within 2 hours of the appointment\nstart time will incur a 30-minute service fee.\nIf a client needs a quote for additional work but decides\nnot to proceed, a 50% visit charge is applied.\nA 30-minute charge will apply if the service is not\nutilized',
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.020),
                                                  const Text(
                                                    'Materials',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Text(
                                                    'Additional materials required, such as fittings or cables,\nwill be subject to separate charges, excluding the\nbooking amount.\nhe procurement of materials is subject to local market\navailability and may take 2-3 days.\nIf the parts are not available, the booking amount will not\nbe refunded.',
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.03),
                                                  const Text(
                                                    'Permits & Cancellation',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Text(
                                                    'Sundays and Public Holidays: Permits must be arranged by\nthe customers, especially for drilling holes\nMonday to Saturday after 5pm: Permission should be\narranged by the customers.\nFull property access is required for all jobs. The service fee\nis non-refundable if the professional is unable to proceed\ndue to permit issues.\nCanceling your booking within 2 hours before the\nappointment start time will incur a charge of 50% of the\ntotal booking value.',
                                                  ),
                                                  const SizedBox(height: 39),
                                                  Container(
                                                    height: height * 0.2,
                                                    width: width,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white10,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            spreadRadius: 20,
                                                            blurRadius: 20),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Center(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors.red,
                                                                child:
                                                                    IconButton(
                                                                  icon: const Center(
                                                                      child: Icon(
                                                                          Icons
                                                                              .remove)),
                                                                  onPressed:
                                                                      () {
                                                                    setModalState(
                                                                        () {
                                                                      if (_count >
                                                                          0) {
                                                                        _count--;
                                                                      }
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.020,
                                                              ),
                                                              Text(
                                                                '$_count',
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            32),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.020,
                                                              ),
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                child:
                                                                    IconButton(
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .add),
                                                                  onPressed:
                                                                      () {
                                                                    setModalState(
                                                                        () {
                                                                      _count++;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.020,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.03,
                                                        ),
                                                        Center(
                                                          child:
                                                              RoundButtonWidget(
                                                                  buttonColor:
                                                                      AppColors
                                                                          .lightgreen,
                                                                  title:
                                                                      'Add  to Cart for AED 130',
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
                                  },
                                );
                              },
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: height * 0.13,
                                      width: width * 0.21,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data!.category!
                                                  .products![index].image
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: height * 0.13,
                                        width: width * 0.7,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.category!
                                                  .products![index].name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(snapshot.data!.category!
                                                .products![index].description
                                                .toString()),
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(snapshot.data!.category!
                                                    .products![index].amount
                                                    .toString()),
                                                SizedBox(
                                                  width: width * 0.350,
                                                ),
                                                if (isAddedToCart[index])
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (quantities[
                                                                    index] >
                                                                0) {
                                                              quantities[
                                                                  index]--;
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          height:
                                                              height * 0.030,
                                                          width: width * 0.06,
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: const Icon(
                                                              Icons.remove),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      Text(
                                                        quantities[index]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            quantities[index]++;
                                                          });
                                                        },
                                                        child: Container(
                                                          height:
                                                              height * 0.030,
                                                          width: width * 0.06,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: const Icon(
                                                              Icons.add),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                else
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isAddedToCart[index] =
                                                            true;
                                                        quantities[index] = 1;
                                                      });
                                                    },
                                                    child: ContainerWidget(
                                                      height: height * 0.03,
                                                      width: width * 0.20,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .lightgreen,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Add Cart',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                    thickness: 3, color: AppColors.lightGrey),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                              ]),
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
