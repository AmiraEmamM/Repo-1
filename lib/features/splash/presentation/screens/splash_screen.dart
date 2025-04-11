import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/core/navigation/navigator.dart';
import 'package:green_pulse/features/auth/presentation/screens/login_screen.dart';

import '../../../../core/config/resource/colors_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.splashImage, // or use Image.network(...)
              fit: BoxFit.cover, // Cover the whole screen
            ),
          ),
          Positioned(
            top: .22.sh,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'GreenPulse',
                    style: AppStyles.bold36.copyWith(color: AppColors.white),
                  ),
                  Center(
                    child: Text(
                      'smart farm at your house',
                      style: AppStyles.regular14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: .8.sh,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                Go.to( const LoginScreen());
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 74.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.blurColor.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(AppCircular.r12),
                  ),
                  child: Text(
                    'Get Started',
                    style: AppStyles.medium20.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
