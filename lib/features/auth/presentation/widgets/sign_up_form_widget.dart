import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/features/auth/presentation/widgets/terms_and_conditions_widget.dart';

import '../../../../core/config/resource/app_size.dart';
import '../../../../core/config/resource/colors_manager.dart';
import '../../../../core/shared/widgets/buttons/loading_button.dart';
import '../../../../core/shared/widgets/text_fields/default_text_field.dart';
import 'input_label_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.sH30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputLabelWidget(title: 'E-mail'),
          SizedBox(height: AppSize.sH4),
          DefaultTextField(
            labelColor: AppColors.darkGreen,
            title: 'Enter E-mail',
            borderColor: AppColors.blurColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSize.sH14,
              horizontal: AppSize.sH16,
            ),
          ),
          SizedBox(height: AppSize.sH14),
          const InputLabelWidget(title: 'Password'),
          SizedBox(height: AppSize.sH4),
          DefaultTextField(
            labelColor: AppColors.darkGreen,
            borderColor: AppColors.blurColor,
            title: "Enter Password",
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSize.sH14,
              horizontal: AppSize.sH16,
            ),
          ),
          SizedBox(height: AppSize.sH14),
          const InputLabelWidget(title: 'Confirm Password'),
          SizedBox(height: AppSize.sH4),
          DefaultTextField(
            labelColor: AppColors.darkGreen,
            borderColor: AppColors.blurColor,
            title: "Confirm Password",
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSize.sH14,
              horizontal: AppSize.sH16,
            ),
          ),
          SizedBox(height: AppSize.sH20),
          const TermsAndConditionsWidget(),
          SizedBox(height: AppSize.sH30),
          LoadingButton(
            color: AppColors.blue2D53EB,
            title: 'SIGN UP',
            borderRadius: 11.25.sp,
            onTap: () async {},
          ),
          SizedBox(height: AppSize.sH12),
        ],
      ),
    );
  }
}
