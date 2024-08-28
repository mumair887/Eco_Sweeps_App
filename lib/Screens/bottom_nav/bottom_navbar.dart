import 'package:flutter/material.dart';
import 'package:service_app/Screens/bottom_nav/account_screen.dart';
import 'package:service_app/Screens/bottom_nav/booking_screen.dart';
import 'package:service_app/Screens/bottom_nav/rewards_screen.dart';
import 'package:service_app/Screens/bottom_nav/uc_screen.dart';

import '../../Constants/App_colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List screens = [
    const UcScreen(),
    const BookingScreen(),
    const RewardsScreen(),
    // const NativeScreen(),
    const AccountScreen(),
  ];
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.grey,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'UC'),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_document), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Rewards'),
            // BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Native'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ]),
      body: screens[myIndex],
    );
  }
}
