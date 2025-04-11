import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/navigation/Constants/imports_constants.dart';
import 'core/config/navigation/Transition/implementation/fade/Option/fade_animation_option.dart';
import 'core/config/navigation/page_router/Implementation/imports_page_router.dart';
import 'core/config/navigation/page_router/imports_page_router_builder.dart';
import 'core/shared/app/green_pulse.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
 await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  PageRouterBuilder().initAppRouter(
    config: PlatformConfig(
      android: CustomPageRouterCreator(
        parentTransition: TransitionType.fade,
        parentOptions: const FadeAnimationOptions(
          duration: Duration(milliseconds: 300),
        ),
      ),
    ),
  );
  runApp(const GreenPulse());
}

