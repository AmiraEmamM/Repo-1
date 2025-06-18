import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/shared/widgets/buttons/loading_button.dart';
import 'package:green_pulse/features/auth/presentation/screens/sign_up_screen.dart';

import '../../../../core/config/navigation/navigator.dart';
import '../../../../core/config/resource/app_size.dart';
import '../../../../core/config/resource/app_styles.dart';
import '../../../../core/config/resource/colors_manager.dart';
import '../../../../core/shared/widgets/text_fields/default_text_field.dart';
import '../../../home_tabs/presentation/screens/home_tab_screen.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.sW40,
        end: AppSize.sW60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.sH4),
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: AppSize.sH4),
          Text("Log in to your account", style: AppStyles.regular14),
          SizedBox(height: AppSize.sH14),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppCircular.r20),
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primaryGreen,
                  width: 1.22.sp,
                ),
              ),
            ),
            child: DefaultTextField(
              radius: AppCircular.r20,
              title: "User Name",
              fillColor: AppColors.greyF5F5F5,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppCircular.r20),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppCircular.r20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: AppSize.sH30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppCircular.r20),
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primaryGreen,
                  width: 1.22.sp,
                ),
              ),
            ),
            child: DefaultTextField(
              radius: AppCircular.r20,
              title: "Password",
              isPassword: true,
              fillColor: AppColors.greyF5F5F5,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppCircular.r20),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppCircular.r20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: AppSize.sH6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forget Password?",
                style: AppStyles.regular14.copyWith(
                  color: AppColors.primaryGreen,
                  fontSize: FontSize.s18,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.sH40),
          Center(
            child: LoadingButton(
              height: 68.h,
              borderRadius: AppCircular.r20,
              color: AppColors.darkBlue,
              fontFamily: 'Poppins',
              fontSize: FontSize.s20,
              title: 'Log In',
              onTap: () async {
                Go.to(const HomeTabScreen());
              },
            ),
          ),
          SizedBox(height: AppSize.sH25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: AppStyles.regular14.copyWith(
                  fontSize: FontSize.s15,
                  color: AppColors.greyAFAFAF,
                ),
              ),
              SizedBox(width: AppSize.sW2),
              TextButton(
                onPressed: () {
                  Go.to( const SignUpScreen());
                },
                child: Text(
                  "SignUp",
                  style: AppStyles.regular14.copyWith(
                    color: AppColors.labelBlack,
                    fontSize: FontSize.s16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
