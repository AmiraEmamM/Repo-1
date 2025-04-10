import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/theme/theme.dart';

import '../../../features/splash/presentation/screens/splash_screen.dart';
import '../../config/resource/app_size.dart';

class GreenPulse extends StatelessWidget {
  const GreenPulse({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(ScreenSizes.width, ScreenSizes.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            home:const SplashScreen(),
          );
        }
      ),
    );
  }
}


