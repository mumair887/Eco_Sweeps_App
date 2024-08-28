
import 'package:flutter/material.dart';

import '../../Constants/App_colors.dart';
import 'most_booked_services.dart';

class SalonForWomen extends StatefulWidget {
  const SalonForWomen({super.key});

  @override
  State<SalonForWomen> createState() => _SalonForWomenState();
}

class _SalonForWomenState extends State<SalonForWomen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Salon for Women',
        ),
        centerTitle: true,
        actions: const [Icon(Icons.share)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              height: height * .24,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/salon.jpg'),
                ),
              ),
            ),
            //---------------------first add end-------------------------------/////

            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MostBookedServices()));
              },
              child: Container(
                height: height * .2,
                width: width,
                decoration: BoxDecoration(color: AppColors.white),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: height * 0.17,
                            width: width * 0.30,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/classic s.jpeg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Salon Classic',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: height * 0.025,
                                  width: width * 0.04,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.greenAccent.shade100,
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                  )),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Container(
                                  height: height * 0.025,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(6)),
                                  child:
                                      const Center(child: Text('ECONOMICAL')),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  'VLCC',
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Container(
                                  height: height * 0.02,
                                  width: width * 0.005,
                                  decoration:
                                      BoxDecoration(color: AppColors.grey),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Text(
                                  'RICHELON',
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Container(
                                  height: height * 0.02,
                                  width: width * 0.005,
                                  decoration:
                                      BoxDecoration(color: AppColors.grey),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Text(
                                  'Crave',
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 2, color: AppColors.lightGrey),

            ///------------------ saloon classic end-----------------------------------------//////////////

            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MostBookedServices()));
              },
              child: Container(
                height: height * .2,
                width: width,
                decoration: BoxDecoration(color: AppColors.white),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: height * 0.17,
                            width: width * 0.30,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/prime s.jpeg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Salon Prime',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: height * 0.025,
                                  width: width * 0.04,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.greenAccent.shade100,
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                  )),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Container(
                                  height: height * 0.025,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Center(child: Text('PREMIUM')),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  'LOREAL',
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Container(
                                  height: height * 0.02,
                                  width: width * 0.005,
                                  decoration:
                                      BoxDecoration(color: AppColors.grey),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Text(
                                  'RICA',
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Container(
                                  height: height * 0.02,
                                  width: width * 0.005,
                                  decoration:
                                      BoxDecoration(color: AppColors.grey),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                Text(
                                  'O',
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 2, color: AppColors.lightGrey),
          ],
        ),
      ),
    );
  }
}
