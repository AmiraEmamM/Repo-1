import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_pulse/core/config/navigation/navigator.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/core/config/resource/colors_manager.dart';
import 'package:green_pulse/core/shared/widgets/buttons/default_button.dart';
import 'package:green_pulse/features/home/presentation/widgets/home_app_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/shared/shared_pref_services.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(isFromDrawer: true),
      body: DrawerScreenBody(),
    );
  }
}

class DrawerScreenBody extends StatelessWidget {
  const DrawerScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeaderWidget(),
        SizedBox(height: 30.h),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 56.0.w),
            child: ListView(
              children: [
                SettingsListTileItem(
                  icon: AppIcons.balanceIcon,
                  title: 'Balance',
                ),
                SizedBox(height: 26.h),
                SettingsListTileItem(icon: AppIcons.backUp, title: 'Backup'),
                SizedBox(height: 20.h),
                Divider(height: 1.h, color: Colors.black),
                SizedBox(height: 20.h),
                SettingsListTileItem(
                  icon: AppIcons.language,
                  title: 'Language',
                ),
                SizedBox(height: 26.h),
                SettingsListTileItem(
                  icon: AppIcons.security,
                  title: 'Security',
                ),
                SizedBox(height: 20.h),
                Divider(height: 1.h, color: Colors.black),
                SizedBox(height: 20.h),
                SettingsListTileItem(icon: AppIcons.about, title: 'About'),
                SizedBox(height: 26.h),
                SettingsListTileItem(
                  icon: AppIcons.feedBack,
                  title: 'Feedback',
                ),
                SizedBox(height: 20.h),
                Divider(height: 1.h, color: Colors.black),
                SizedBox(height: 20.h),
                SettingsListTileItem(
                  onTap: () async {
                    await SharedPrefService.logout();
                   Go.offAll( const LoginScreen());
                  },
                    icon: AppIcons.logout, title: 'Logout'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerHeaderWidget extends StatefulWidget {
  const DrawerHeaderWidget({super.key});

  @override
  State<DrawerHeaderWidget> createState() => _DrawerHeaderWidgetState();
}

class _DrawerHeaderWidgetState extends State<DrawerHeaderWidget> {
  String? imagePath;
  String? username;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final savedImage = await SharedPrefService.getImagePath();
    final savedUsername = await SharedPrefService.getUsername();
    setState(() {
      imagePath = savedImage;
      username = savedUsername ?? 'User';
    });
  }

  Future<void> pickAndSetImage() async {
    final path = await pickProfileImage(
      ImageSource.gallery,
    ); // or ImageSource.camera
    if (path != null) {
      setState(() {
        imagePath = path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 37.w,
        right: 30.w,
        top: 33.h,
        bottom: 33.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: pickAndSetImage,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 26.w,
                          vertical: 26.h,
                        ),
                        width: 140.w,
                        height: 140.h,
                        decoration: const BoxDecoration(
                          color: AppColors.blue5177FF,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child:
                              imagePath != null
                                  ? Image.file(
                                    File(imagePath!),
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(AppImages.avatar),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(username ?? 'User', style: AppStyles.semiBold15),
                  ],
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username??'', style: AppStyles.semiBold15),
                      SizedBox(height: 10.h),
                      Text('1 Sep 2002', style: AppStyles.semiBold15),
                      SizedBox(height: 10.h),
                      DefaultButton(
                        title: 'Edit Profile',
                        color: AppColors.blue5177FF,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppIcons.menuIconSettings),
        ],
      ),
    );
  }
}

class SettingsListTileItem extends StatelessWidget {
  const SettingsListTileItem({
    super.key,
    required this.icon,
    required this.title, this.onTap,
  });
  final String icon;
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 30.w),
          Text(title, style: AppStyles.medium15),
          const Spacer(),
          SvgPicture.asset(AppIcons.goIcon),
        ],
      ),
    );
  }
}

List<String> settingsIcons = [
  AppIcons.balanceIcon,
  AppIcons.backUp,
  AppIcons.language,
  AppIcons.security,
  AppIcons.about,
  AppIcons.feedBack,
  AppIcons.logout,
];
List<String> settingsTitles = [
  'Balance',
  'Backup',
  'Language',
  'Security',
  'About',
  'Feedback',
  'Logout',
];
