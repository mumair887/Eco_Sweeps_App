import 'package:flutter/material.dart';


import '../../Constants/App_colors.dart';
import '../../Widgets/container_widget.dart';

class SaloonForWomenService extends StatefulWidget {
  const SaloonForWomenService({super.key});

  @override
  State<SaloonForWomenService> createState() => _SaloonForWomenServiceState();
}

class _SaloonForWomenServiceState extends State<SaloonForWomenService> {

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
                              children: [
                                ContainerWidget(
                                  height: height * 0.09,
                                  width: width * 0.23,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightGrey,
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/woman (1).png',
                                        ),
                                      )),
                                ),
                                const Text(
                                  'saloon for\nwomen ',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            );
  }
}