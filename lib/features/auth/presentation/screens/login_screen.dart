import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import '../../../../core/shared/widgets/app_title_widget.dart';
import '../widgets/auth_clip_path.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: TopCurveClipper(),
              child: Image.asset(
                AppImages.autImage,
                height: .35.sh,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const AppTitleWidget(),
            const LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}

