import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import '../../../../core/config/resource/app_assets.dart';
import '../../../../core/shared/widgets/app_title_widget.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/auth_clip_path.dart';
import '../widgets/or_text_widget.dart';
import '../widgets/sign_up_form_widget.dart';
import '../widgets/social_media_buttons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                height: .33.sh,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const AppTitleWidget(),
            SizedBox(height: AppSize.sH10),
            const SignUpFormWidget(),
            SizedBox(height: AppSize.sH12),
            const OrTextWidget(),
            SizedBox(height: AppSize.sH20),
            const SocialMediaButtons(),
            SizedBox(height: AppSize.sH10),
           const AlreadyHaveAnAccount(),
            SizedBox(height: AppSize.sH22),
          ],
        ),
      ),
    );
  }
}

