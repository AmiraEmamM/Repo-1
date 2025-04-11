import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/theme/theme.dart';
import 'package:green_pulse/core/navigation/navigator.dart';
import 'package:green_pulse/core/navigation/route_generator.dart';

import '../../../features/splash/presentation/screens/splash_screen.dart';
import '../../config/resource/app_size.dart';
import '../route_observer.dart';

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
            onGenerateRoute: RouterGenerator.getRoute,
            navigatorKey: Go.navigatorKey,
            navigatorObservers: [AppNavigationObserver()],
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
