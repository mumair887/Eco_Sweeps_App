import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Controller/auth_controller.dart';

import 'package:service_app/Controller/category_controller.dart';

import 'package:service_app/Screens/detailed_screens/cleaning_categories/cleaning_subcategory.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';

import 'package:service_app/Widgets/custom_textformfield.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../Constants/App_colors.dart';

class UcScreen extends StatefulWidget {
  const UcScreen({super.key});

  @override
  State<UcScreen> createState() => _UcScreenState();
}

class _UcScreenState extends State<UcScreen> {
  List maintain = [
    'assets/paint.jpg',
    'assets/main.jpg',
    'assets/tank.jpg',
  ];
  List maintaindetail = [
    "Home Painting",
    'Maintainance',
    "Water Tank Cleaning",
  ];
  List ladies = [
    'assets/wo1.jpg',
    'assets/wo2.jpg',
    'assets/lash.jpg',
    'assets/wo4.jpg',
    'assets/wo5.jpg',
    'assets/wo6.jpg',
    'assets/wo7.jpg',
  ];
  List ladiesdetail = [
    "Hair Care",
    "Women's Spa",
    'Lashes and Brows',
    'Spray Training',
    'Nail Extensions',
    'Womens Saloon',
    'Luxury Women Saloon'
  ];
  List ac = [
    'assets/duct.jpg',
    'assets/split.jpg',
    'assets/window.jpg',
  ];
  List acdetail = [
    "Duct/Central AC",
    'Split AC',
    "Window AC",
  ];
  List cleaning = [
    'assets/homeclean.jpg',
    'assets/shoec.jpg',
    'assets/deep.jpg',
    'assets/acclean.jpg',
  ];
  List cleaningdetail = [
    "Home Cleaning",
    'Shoe Cleaning',
    "Deep Clean",
    'AC Cleaning',
  ];
  List acservices = [
    'assets/ac ser.jpg',
    'assets/pani.jpg',
    'assets/oven.jpg',
    'assets/frej.jpg',
    'assets/machine.jpg'
  ];
  List salonwomen1 = [
    'assets/wave.jpg',
    'assets/ref.jpg',
    'assets/w2.jpg',
    'assets/w3.jpg',
    'assets/w4.jpg',
  ];
  List salonwomen2 = [
    'assets/w5.jpg',
    'assets/w6.jpg',
    'assets/w1.jpg',
  ];

  List wo = [
    'assets/physio.jpg',
    'assets/nurse.jpg',
    'assets/consult.jpg',
    'assets/pcr.jpg',
    'assets/flu.jpg',
    'assets/phys coun.jpg',
    'assets/labtest.jpg',
    'assets/therapy.jpg'
  ];
  List wodetail = [
    "Physchotherapy\nat Home",
    "Nurse care at Home",
    'Doctor Consultation',
    'PCR Test at Home',
    'Flu Vaccine at Home',
    'Physchother\nand Counsling',
    'Lab Tests at Home',
    'IV Therapy at Home'
  ];
  List mostbook = [
    'assets/vacuum.png',
    'assets/laundry-machine.png',
    'assets/woman (1).png',
    'assets/man.png',
    'assets/maintainance.png',
    'assets/car-wash.png',
    'assets/air.png',
    'assets/pest-control.png',
    'assets/healthcare.png',
    'assets/vehicle.png',
    'assets/repair-shop.png',
    'assets/mattress.png',
    'assets/gardening.png',
    'assets/apliance.jpg',
    'assets/cooking.png',
    'assets/car re.jpg',
    'assets/movers p.png',
    'assets/rent p.png',
    'assets/kids.jpg'
  ];

  final List<String> crouselpics = [
    'assets/first.jpg',
    'assets/second.jpg',
    'assets/third.jpg',
    'assets/fourth.jpg',
    'assets/fifth.jpg',
    'assets/2ndlast.jpg',
    'assets/last.jpg'
  ];

  List appservices = [
    'Cleaning',
    'Laundry',
    'ladies',
    'Mens Saloon',
    'Maintainance',
    'Car wash at home/office',
    'Ac Repair',
    'Pest Control',
    'Health care at home',
    'Car on rent',
    'Car repair',
    'Furniture cleaning',
    'Gardner',
    'Appliances repair',
    'Chef',
    'Recovery Vehicle',
    'Movers & Packers',
    'Loading Vehicle',
    'Kids Saloon'
  ];

  CategoryController categoryController = CategoryController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        drawer: Drawer(
          backgroundColor: Colors.amber,
          child: Column(
            children: [
              //
              RoundButtonWidget(
                  title: 'logout',
                  onpress: () async {
                    AuthController()
                        .logout(await SharedPrefrenceData.getUserId());
                  }),
              const SizedBox(
                height: 20,
              ),
              RoundButtonWidget(
                  title: 'delete',
                  onpress: () async {
                    AuthController()
                        .deleteAccount(await SharedPrefrenceData.getUserId(), context);
                  })
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
                child: Column(children: [
              SafeArea(
                  child: Column(children: [
                ListTile(
                    title: const Text(
                      'Multan',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Sabzazar Colony-Multan-Pakistan'),
                    trailing: CircleAvatar(
                      backgroundColor: AppColors.lightgreen,
                      child: const Icon(Icons.shopping_cart_outlined),
                    )),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  hintText: 'Look for services',
                  bordercolor: AppColors.black,
                  prefixIcon: Icons.search,
                ),
                SizedBox(height: height * 0.02),

                ////----------------------First services start--------------------//////
                ///
                FutureBuilder(
                    future: categoryController.fetchCategory(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisExtent: 130,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          log('${snapshot.data!.data![index].name}');
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CleaningSubcategoryScreen(
                                            id: snapshot.data!.data![index].id
                                                .toString()),
                                  ));
                            },
                            child: Container(
                              height: height * 0.15,
                              width: width * .40,
                              decoration: const BoxDecoration(),
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.10,
                                    width: width * .27,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.black),
                                      color: AppColors.lightGrey,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data!.data![index].image
                                              .toString()),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.data![index].name.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),

                Divider(thickness: 5, color: AppColors.lightGrey),

                ///----------------------End first portion---------------------------------///

                ///------------------crousel slider portion start--------------------/////

                CarouselSlider(
                  items: crouselpics.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(item))),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: height * .23,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 600),
                    viewportFraction: 0.8,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Divider(thickness: 5, color: AppColors.lightGrey),

                //----------healthcare at home part start --------------------///
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Healthcare at home',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      height: height * .20,
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const LaundryDetailScreen()));
                        },
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: wo.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    height: height * .14,
                                    width: width * 0.43,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              wo[index],
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    wodetail[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                Divider(thickness: 5, color: AppColors.lightGrey),

                ///-----------Cleaning part start--------------------------/////
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cleaning',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Seel all',
                      style: TextStyle(color: AppColors.purple),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * .20,
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const LaundryDetailScreen()));
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: height * .14,
                                width: width * 0.43,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          cleaning[index],
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                cleaningdetail[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                Divider(thickness: 5, color: AppColors.lightGrey),

                // //------------------------AC Repair start-----------------------------///

                Column(children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AC Repair',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Seel all',
                        style: TextStyle(color: AppColors.purple),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * .20,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const LaundryDetailScreen()));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: height * .14,
                                  width: width * 0.43,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            ac[index],
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  acdetail[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(thickness: 5, color: AppColors.lightGrey),

                  ///--------------------------Ladies Saloon start----------------------------//////////
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Womens Saloon',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Seel all',
                        style: TextStyle(color: AppColors.purple),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * .20,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const LaundryDetailScreen()));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ladies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: height * .14,
                                  width: width * 0.43,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            ladies[index],
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  ladiesdetail[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  Divider(thickness: 5, color: AppColors.lightGrey),

                  ///---------------------Maintainance part start-------------------------/////

                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Maintainance',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Seel all',
                        style: TextStyle(color: AppColors.purple),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * .20,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const LaundryDetailScreen()));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: maintain.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: height * .14,
                                  width: width * 0.43,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            maintain[index],
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  maintaindetail[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  //
                ])
              ]))
            ]))));
  }
}
