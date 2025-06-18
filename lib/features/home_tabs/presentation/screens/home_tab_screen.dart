import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/colors_manager.dart';
import 'package:green_pulse/features/home/presentation/screens/home_screen.dart';

import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../health_mentor/presentation/screens/health_mentor.dart';
import '../../../home/presentation/widgets/home_app_bar.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const CartScreen(),
    const HealthMentor(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(AppIcons.homeIcon),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.homeIcon),
                SizedBox(height: 4.h),
                Container(width: 20.w, height: 2.h, color: AppColors.darkGreen),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(AppIcons.profileIcon),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.profileIcon),
                SizedBox(height: 4.h),
                Container(width: 20.w, height: 2.h, color: AppColors.darkGreen),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(AppIcons.cartIcon),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.cartIcon),
                SizedBox(height: 4.h),
                Container(width: 20.w, height: 2.h, color: AppColors.darkGreen),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(AppIcons.healthMentorIcon),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.healthMentorIcon),
                SizedBox(height: 4.h),
                Container(width: 20.w, height: 2.h, color: AppColors.darkGreen),
              ],
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: _screens[currentIndex],
    );
  }
}
