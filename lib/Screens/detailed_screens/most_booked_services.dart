import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Widgets/offer_container_widget.dart';

import '../../Constants/App_colors.dart';

class MostBookedServices extends StatefulWidget {
  const MostBookedServices({super.key});

  @override
  State<MostBookedServices> createState() => _MostBookedServicesState();
}

class _MostBookedServicesState extends State<MostBookedServices> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share))
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * .25,
                width: width,
                decoration: BoxDecoration(color: AppColors.grey),
              ),
              const Text(
                'Monthly cleaning\n Subscription',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                  ),
                  Text('4.81 (6.6 M bookings)')
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),

              ///---------------------------bottom sheet start-------------------////
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        height: height * .8,
                        width: width,
                        decoration: const BoxDecoration(color: Colors.white),
                      );
                    },
                  );
                },
                child: Container(
                  height: height * 0.06,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.blueGrey,
                      ),
                      Text('ECS Professional Cleaning Guide'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: height * 0.08,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Icon(
                          Icons.add_circle,
                          color: AppColors.purple,
                        ),
                        title: const Text(
                          'Save 10% on every order',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('Get Plus now'),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Container(
                      height: height * 0.08,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Icon(
                          Icons.beenhere_rounded,
                          color: AppColors.green,
                        ),
                        title: const Text(
                          'CRED cashback up to \$60',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('Cashback up to \$ 70 via CR..'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(thickness: 5, color: AppColors.lightGrey),
              SizedBox(
                height: height * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const OfferContainerWidget(),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    const OfferContainerWidget(),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    const OfferContainerWidget(),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    const OfferContainerWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(thickness: 5, color: AppColors.lightGrey),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Ensures the ListView doesn't scroll
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Super saver deals',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'Cleaning Guide',
                            style: TextStyle(
                                color: AppColors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('RS. 404 PER BATHROOM'),
                              Text(
                                'Intense cleaning-2',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'bathroom pack',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                  Text('4.78 (1.6M reviews)'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('\$20'),
                                  Text('2 hrs 40 minutes')
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                height: height * 0.11,
                                width: width * 0.23,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade200,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Text(
                                      '2',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.green),
                                    ),
                                    const Text(
                                      'BATHROOMS',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 80, left: 10),
                                height: height * 0.03,
                                width: width * 0.18,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                    child: Text(
                                  'Add',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.purple),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const DottedLine(
                        lineThickness: 1.0,
                        dashColor: Colors.grey,
                        lineLength: 250,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              '1-Hard-water stain removal from toilet\n   pot,basin,exhaust,tiles etc'),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text(
                              '2-Intense cleaning with scrubbing\n   machine at only \$20/bathroom'),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Divider(thickness: 3, color: AppColors.lightGrey),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
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

// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:service_app/Components/App_colors.dart';
// import 'package:service_app/Components/bath_container_wiget.dart';
// import 'package:service_app/Components/offer_container_widget.dart';
// import 'package:service_app/Components/text_widgets.dart';

// class MostBookedServices extends StatefulWidget {
//   const MostBookedServices({super.key});

//   @override
//   State<MostBookedServices> createState() => _MostBookedServicesState();
// }

// class _MostBookedServicesState extends State<MostBookedServices> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     double width = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Row(
//             children: [
//               IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.share))
//             ],
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: height * .25,
//                   width: width,
//                   decoration: BoxDecoration(color: AppColors.grey),
//                 ),
//                 const Text(
//                   'Bathroom & kitchen cleaning',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const Row(
//                   children: [
//                     Icon(
//                       Icons.star,
//                       size: 20,
//                     ),
//                     Text('4.81 (6.6 M bookings)')
//                   ],
//                 ),
//                 SizedBox(
//                   height: height * 0.01,
//                 ),
//                 Container(
//                   height: height * 0.06,
//                   width: width,
//                   decoration: BoxDecoration(
//                       color: AppColors.lightGrey,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(
//                         Icons.favorite,
//                         color: Colors.blueGrey,
//                       ),
//                       Text('ECS Professional Cleaning Guide'),
//                       Icon(Icons.arrow_forward_ios)
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: height * 0.08,
//                         width: width * 0.8,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: AppColors.grey,
//                             ),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: ListTile(
//                           leading: Icon(
//                             Icons.add_circle,
//                             color: AppColors.purple,
//                           ),
//                           title: const Text(
//                             'Save 10% on every order',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: const Text('Get Plus now'),
//                         ),
//                       ),
//                       SizedBox(
//                         width: width * 0.02,
//                       ),
//                       Container(
//                         height: height * 0.08,
//                         width: width * 0.8,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: AppColors.grey,
//                             ),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: ListTile(
//                           leading: Icon(
//                             Icons.beenhere_rounded,
//                             color: AppColors.green,
//                           ),
//                           title: const Text(
//                             'CRED cashback up to \$60',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: const Text('Cashback up to \$ 70 via CR..'),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 Divider(thickness: 5, color: AppColors.lightGrey),
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       const OfferContainerWidget(),
//                       SizedBox(
//                         width: width * 0.04,
//                       ),
//                       const OfferContainerWidget(),
//                       SizedBox(
//                         width: width * 0.04,
//                       ),
//                       const OfferContainerWidget(),
//                       SizedBox(
//                         width: width * 0.04,
//                       ),
//                       const OfferContainerWidget(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 Divider(thickness: 5, color: AppColors.lightGrey),
//                 ListView.builder(
//                   itemCount: 5,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Super saver deals',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                             Text(
//                               'Cleaning Guide',
//                               style: TextStyle(
//                                   color: AppColors.purple,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const Icon(Icons.arrow_forward_ios_outlined)
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.02,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('RS. 404 PER BATHROOM'),
//                                 Text(
//                                   'Intense cleaning-2',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   'bathroom pack',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       size: 20,
//                                     ),
//                                     Text('4.78 (1.6M reviews)'),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text('\$20'),
//                                     Text('2 hrs 40 minutes')
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Stack(
//                               children: [
//                                 Container(
//                                   height: height * 0.11,
//                                   width: width * 0.23,
//                                   decoration: BoxDecoration(
//                                       color: Colors.green.shade200,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         '2',
//                                         style: TextStyle(
//                                             fontSize: 40,
//                                             fontWeight: FontWeight.bold,
//                                             color: AppColors.green),
//                                       ),
//                                       const Text(
//                                         'BATHROOMS',
//                                         style: TextStyle(color: Colors.black),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   margin:
//                                       const EdgeInsets.only(top: 80, left: 10),
//                                   height: height * 0.03,
//                                   width: width * 0.18,
//                                   decoration: BoxDecoration(
//                                       color: AppColors.white,
//                                       border: Border.all(color: AppColors.grey),
//                                       borderRadius: BorderRadius.circular(6)),
//                                   child: Center(
//                                       child: Text(
//                                     'Add',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.purple),
//                                   )),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         const DottedLine(
//                           lineThickness: 1.0,
//                           dashColor: Colors.grey,
//                           lineLength: 250,
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                                 '1-Hard-water stain removal from toilet\n   pot,basin,exhaust,tiles etc'),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             const Text(
//                                 '2-Intense cleaning with scrubbing\n   machine at only \$20/bathroom'),
//                           ],
//                         ),
//                         TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               'View details',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             )),
//                         Divider(thickness: 3, color: AppColors.lightGrey),
//                         SizedBox(
//                           height: height * 0.02,
//                         ),
//                       ],
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
