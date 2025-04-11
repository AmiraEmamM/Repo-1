import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/features/auth/presentation/screens/login_screen.dart';

import '../../../../core/config/navigation/navigator.dart';
import '../../../../core/config/resource/colors_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _text1Animation;
  late Animation<Offset> _text2Animation;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _text1Animation = Tween<Offset>(
      begin: const Offset(0, -1), // Start above the screen
      end:  Offset(0, -0.27.h), // End slightly above the center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _text2Animation = Tween<Offset>(
      begin: const Offset(1, 0), // Start from the right
      end:  Offset(0, -0.23.h), // End slightly to the right
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _buttonAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start below the screen
      end: const Offset(0, 0.3), // End slightly below the center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.splashImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: .22.sh,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _text1Animation,
              child: Center(
                child: Text(
                  'GreenPulse',
                  style: AppStyles.bold36.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: .28.sh,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _text2Animation,
              child: Center(
                child: Text(
                  'smart farm at your house',
                  style: AppStyles.regular14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: .8.sh,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _buttonAnimation,
              child: GestureDetector(
                onTap: () {
                  Go.to(const LoginScreen());
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
          ),
        ],
      ),
    );
  }
}