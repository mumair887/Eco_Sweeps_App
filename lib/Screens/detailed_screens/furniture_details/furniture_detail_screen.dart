import 'package:flutter/material.dart';
import 'package:service_app/Screens/detailed_screens/bank&address_detail_screen/address_detail.dart';
import 'package:service_app/Widgets/container_widget.dart';
import 'package:service_app/Widgets/listview_widget.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../../Constants/App_colors.dart';

class FurnitureCleaningDetailScreen extends StatefulWidget {
  const FurnitureCleaningDetailScreen({super.key});

  @override
  State<FurnitureCleaningDetailScreen> createState() =>
      _FurnitureCleaningDetailScreenState();
}

class _FurnitureCleaningDetailScreenState
    extends State<FurnitureCleaningDetailScreen> {
  List<int> quantities = List.filled(6, 0);
  List<bool> isAddedToCart = List.filled(6, false);

  List bestseller = [
    '3 Seater(30% OFF)',
    '3 Seater L-Shaped',
    '3 Seater Sofa Bed',
    '3 Seater L-Shaped sofa bed',
    '4 Seater',
    '5 Seater',
  ];

  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count - 1;
    });
  }

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
              const Text(
                'Furniture Cleaning Service',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2, color: AppColors.lightGrey),
              SizedBox(
                height: height * 0.02,
              ),
              ContainerWidget(
                height: height * 0.05,
                width: width,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, top: 6),
                  child: Text(
                    'Sofa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(thickness: 2, color: AppColors.lightGrey),

              //------------------listview builder widget start---------------------///
              SizedBox(
                // height: height,
                child: ListviewWidget(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    decoration: const BoxDecoration(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //---------------------------details bottom modal sheet start-----------------------////

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
                                      color: Colors.white,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
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
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            const Text(
                                              'Hourly Electrician',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'AED 169',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    decoration: TextDecoration
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
                                                  fontWeight: FontWeight.bold),
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
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              'A visit charge of AED 129 is applicable, covering the first\nhour of work(excluding materials cost)A fee of AED 65 will be charged for every additional 30\nminutes of service after the first hour.\nCanceling the booking within 2 hours of the appointment\nstart time will incur a 30-minute service fee.\nIf a client needs a quote for additional work but decides\nnot to proceed, a 50% visit charge is applied.\nA 30-minute charge will apply if the service is not\nutilized',
                                            ),
                                            SizedBox(height: height * 0.020),
                                            const Text(
                                              'Materials',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              'Additional materials required, such as fittings or cables,\nwill be subject to separate charges, excluding the\nbooking amount.\nhe procurement of materials is subject to local market\navailability and may take 2-3 days.\nIf the parts are not available, the booking amount will not\nbe refunded.',
                                            ),
                                            SizedBox(height: height * 0.03),
                                            const Text(
                                              'Permits & Cancellation',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          child: IconButton(
                                                            icon: const Center(
                                                                child: Icon(Icons
                                                                    .remove)),
                                                            onPressed: () {
                                                              setModalState(() {
                                                                _count--;
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
                                                              const TextStyle(
                                                                  fontSize: 32),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.020,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          child: IconButton(
                                                            icon: const Icon(
                                                                Icons.add),
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
                                                        buttonColor: AppColors
                                                            .lightgreen,
                                                        title:
                                                            'Add for AED 130',
                                                        onpress: () {
                                                          ////---------------------payment botom sheet start----------------------------////
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder: (context) {
                                                              return ContainerWidget(
                                                                height:
                                                                    height * .5,
                                                                width: width,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          10),
                                                                  child: Column(
                                                                      children: [
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
                                                                          children: [
                                                                            Text(' Fee:'),
                                                                            Text('Rs. 30')
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.02,
                                                                        ),
                                                                        Divider(
                                                                            thickness:
                                                                                3,
                                                                            color:
                                                                                AppColors.lightGrey),
                                                                        const Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text('Total payable:'),
                                                                            Text('Rs. 130')
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.04,
                                                                        ),
                                                                        const Text(
                                                                          'Pay via:',
                                                                          style: TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.01,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/meezan.jpg'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/dub bank.jpg'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/jazz.png'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.05,
                                                                        ),
                                                                        RoundButtonWidget(
                                                                          title:
                                                                              'CheckOut',
                                                                          onpress:
                                                                              () {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (context) => const BookAddressDetail()));
                                                                          },
                                                                          buttonColor:
                                                                              AppColors.lightgreen,
                                                                        )
                                                                      ]),
                                                                ),
                                                              );
                                                            },
                                                          );
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
                              Image.asset(
                                'assets/sofa.jpg',
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bestseller[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                        'Crisp and clean, dry cleaned in 48 hours'),
                                    SizedBox(
                                      height: height * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        const Text('AED 20'),
                                        SizedBox(
                                          width: width * 0.420,
                                        ),
                                        if (isAddedToCart[index])
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (quantities[index] > 0) {
                                                      quantities[index]--;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: height * 0.030,
                                                  width: width * 0.06,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child:
                                                      const Icon(Icons.remove),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.01,
                                              ),
                                              Text(
                                                quantities[index].toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                  height: height * 0.030,
                                                  width: width * 0.06,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          )
                                        else
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isAddedToCart[index] = true;
                                                quantities[index] = 1;
                                              });
                                            },
                                            child: ContainerWidget(
                                              height: height * 0.03,
                                              width: width * 0.20,
                                              decoration: BoxDecoration(
                                                color: AppColors.lightgreen,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Add Cart',
                                                  style: TextStyle(
                                                      color: AppColors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 3, color: AppColors.lightGrey),
                          SizedBox(
                            height: height * 0.02,
                          )
                        ]),
                      );
                    }),
              ),

              ///--------------------------Best seller end--------------------///
              ContainerWidget(
                height: height * 0.05,
                width: width,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, top: 6),
                  child: Text(
                    'Mattress',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(thickness: 2, color: AppColors.lightGrey),

              //------------------listview builder widget start---------------------///
              SizedBox(
                // height: height,
                child: ListviewWidget(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    decoration: const BoxDecoration(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //---------------------------details bottom modal sheet start-----------------------////

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
                                      color: Colors.white,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
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
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            const Text(
                                              'Hourly Electrician',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'AED 169',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    decoration: TextDecoration
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
                                                  fontWeight: FontWeight.bold),
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
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              'A visit charge of AED 129 is applicable, covering the first\nhour of work(excluding materials cost)A fee of AED 65 will be charged for every additional 30\nminutes of service after the first hour.\nCanceling the booking within 2 hours of the appointment\nstart time will incur a 30-minute service fee.\nIf a client needs a quote for additional work but decides\nnot to proceed, a 50% visit charge is applied.\nA 30-minute charge will apply if the service is not\nutilized',
                                            ),
                                            SizedBox(height: height * 0.020),
                                            const Text(
                                              'Materials',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              'Additional materials required, such as fittings or cables,\nwill be subject to separate charges, excluding the\nbooking amount.\nhe procurement of materials is subject to local market\navailability and may take 2-3 days.\nIf the parts are not available, the booking amount will not\nbe refunded.',
                                            ),
                                            SizedBox(height: height * 0.03),
                                            const Text(
                                              'Permits & Cancellation',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          child: IconButton(
                                                            icon: const Center(
                                                                child: Icon(Icons
                                                                    .remove)),
                                                            onPressed: () {
                                                              setModalState(() {
                                                                _count--;
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
                                                              const TextStyle(
                                                                  fontSize: 32),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.020,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          child: IconButton(
                                                            icon: const Icon(
                                                                Icons.add),
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
                                                        buttonColor: AppColors
                                                            .lightgreen,
                                                        title:
                                                            'Add for AED 130',
                                                        onpress: () {
                                                          ////---------------------payment botom sheet start----------------------------////
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder: (context) {
                                                              return ContainerWidget(
                                                                height:
                                                                    height * .5,
                                                                width: width,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          10),
                                                                  child: Column(
                                                                      children: [
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
                                                                          children: [
                                                                            Text(' Fee:'),
                                                                            Text('Rs. 30')
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.02,
                                                                        ),
                                                                        Divider(
                                                                            thickness:
                                                                                3,
                                                                            color:
                                                                                AppColors.lightGrey),
                                                                        const Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text('Total payable:'),
                                                                            Text('Rs. 130')
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.04,
                                                                        ),
                                                                        const Text(
                                                                          'Pay via:',
                                                                          style: TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.01,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/meezan.jpg'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/dub bank.jpg'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/jazz.png'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.05,
                                                                        ),
                                                                        RoundButtonWidget(
                                                                          title:
                                                                              'CheckOut',
                                                                          onpress:
                                                                              () {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (context) => const BookAddressDetail()));
                                                                          },
                                                                          buttonColor:
                                                                              AppColors.lightgreen,
                                                                        )
                                                                      ]),
                                                                ),
                                                              );
                                                            },
                                                          );
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
                              Image.asset(
                                'assets/sofa.jpg',
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bestseller[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                        'Crisp and clean, dry cleaned in 48 hours'),
                                    SizedBox(
                                      height: height * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        const Text('AED 20'),
                                        SizedBox(
                                          width: width * 0.420,
                                        ),
                                        if (isAddedToCart[index])
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (quantities[index] > 0) {
                                                      quantities[index]--;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: height * 0.030,
                                                  width: width * 0.06,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child:
                                                      const Icon(Icons.remove),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.01,
                                              ),
                                              Text(
                                                quantities[index].toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                  height: height * 0.030,
                                                  width: width * 0.06,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          )
                                        else
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isAddedToCart[index] = true;
                                                quantities[index] = 1;
                                              });
                                            },
                                            child: ContainerWidget(
                                              height: height * 0.03,
                                              width: width * 0.20,
                                              decoration: BoxDecoration(
                                                color: AppColors.lightgreen,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Add Cart',
                                                  style: TextStyle(
                                                      color: AppColors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 3, color: AppColors.lightGrey),
                          SizedBox(
                            height: height * 0.02,
                          )
                        ]),
                      );
                    }),
              ),

              ///-----------------------------Bag - wash& fold  end-----------------------------------///
              ContainerWidget(
                height: height * 0.05,
                width: width,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, top: 6),
                  child: Text(
                    'Combos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(thickness: 2, color: AppColors.lightGrey),

              //------------------listview builder widget start---------------------///
              SizedBox(
                // height: height,
                child: ListviewWidget(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    decoration: const BoxDecoration(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //---------------------------details bottom modal sheet start-----------------------////

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
                                      color: Colors.white,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
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
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            const Text(
                                              'Hourly Electrician',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'AED 169',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    decoration: TextDecoration
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
                                                  fontWeight: FontWeight.bold),
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
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              'A visit charge of AED 129 is applicable, covering the first\nhour of work(excluding materials cost)A fee of AED 65 will be charged for every additional 30\nminutes of service after the first hour.\nCanceling the booking within 2 hours of the appointment\nstart time will incur a 30-minute service fee.\nIf a client needs a quote for additional work but decides\nnot to proceed, a 50% visit charge is applied.\nA 30-minute charge will apply if the service is not\nutilized',
                                            ),
                                            SizedBox(height: height * 0.020),
                                            const Text(
                                              'Materials',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              'Additional materials required, such as fittings or cables,\nwill be subject to separate charges, excluding the\nbooking amount.\nhe procurement of materials is subject to local market\navailability and may take 2-3 days.\nIf the parts are not available, the booking amount will not\nbe refunded.',
                                            ),
                                            SizedBox(height: height * 0.03),
                                            const Text(
                                              'Permits & Cancellation',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          child: IconButton(
                                                            icon: const Center(
                                                                child: Icon(Icons
                                                                    .remove)),
                                                            onPressed: () {
                                                              setModalState(() {
                                                                _count--;
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
                                                              const TextStyle(
                                                                  fontSize: 32),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.020,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          child: IconButton(
                                                            icon: const Icon(
                                                                Icons.add),
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
                                                        buttonColor: AppColors
                                                            .lightgreen,
                                                        title:
                                                            'Add for AED 130',
                                                        onpress: () {
                                                          ////---------------------payment botom sheet start----------------------------////
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder: (context) {
                                                              return ContainerWidget(
                                                                height:
                                                                    height * .5,
                                                                width: width,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          10),
                                                                  child: Column(
                                                                      children: [
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
                                                                          children: [
                                                                            Text(' Fee:'),
                                                                            Text('Rs. 30')
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.02,
                                                                        ),
                                                                        Divider(
                                                                            thickness:
                                                                                3,
                                                                            color:
                                                                                AppColors.lightGrey),
                                                                        const Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text('Total payable:'),
                                                                            Text('Rs. 130')
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.04,
                                                                        ),
                                                                        const Text(
                                                                          'Pay via:',
                                                                          style: TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.01,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/meezan.jpg'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/dub bank.jpg'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                            Container(
                                                                              height: height * 0.09,
                                                                              width: width * 0.22,
                                                                              decoration: BoxDecoration(image: const DecorationImage(image: AssetImage('assets/jazz.png'), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.05,
                                                                        ),
                                                                        RoundButtonWidget(
                                                                          title:
                                                                              'CheckOut',
                                                                          onpress:
                                                                              () {
                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: (context) => const BookAddressDetail()));
                                                                          },
                                                                          buttonColor:
                                                                              AppColors.lightgreen,
                                                                        )
                                                                      ]),
                                                                ),
                                                              );
                                                            },
                                                          );
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
                              Image.asset(
                                'assets/sofa.jpg',
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bestseller[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                        'Crisp and clean, dry cleaned in 48 hours'),
                                    SizedBox(
                                      height: height * 0.04,
                                    ),
                                    Row(
                                      children: [
                                        const Text('AED 20'),
                                        SizedBox(
                                          width: width * 0.420,
                                        ),
                                        if (isAddedToCart[index])
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (quantities[index] > 0) {
                                                      quantities[index]--;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: height * 0.030,
                                                  width: width * 0.06,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child:
                                                      const Icon(Icons.remove),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.01,
                                              ),
                                              Text(
                                                quantities[index].toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                  height: height * 0.030,
                                                  width: width * 0.06,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          )
                                        else
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isAddedToCart[index] = true;
                                                quantities[index] = 1;
                                              });
                                            },
                                            child: ContainerWidget(
                                              height: height * 0.03,
                                              width: width * 0.20,
                                              decoration: BoxDecoration(
                                                color: AppColors.lightgreen,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Add Cart',
                                                  style: TextStyle(
                                                      color: AppColors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 3, color: AppColors.lightGrey),
                          SizedBox(
                            height: height * 0.02,
                          )
                        ]),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
