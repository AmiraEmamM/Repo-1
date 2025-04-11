import 'package:flutter/material.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/core/config/resource/colors_manager.dart';
import 'package:green_pulse/features/auth/presentation/widgets/check_box_widget.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const CheckBoxWidget(),
          SizedBox(width: AppSize.sW10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "by signing up you agree to our ",
                    style: AppStyles.medium20.copyWith(
                      color: AppColors.grey888888,
                      fontSize: FontSize.s15,
                    ),
                  ),
                  TextSpan(
                    text: "terms & conditions ",
                    style: AppStyles.medium20.copyWith(
                      color: AppColors.blackText,
                      fontSize: FontSize.s15,
                    ),
                  ),
                  TextSpan(
                    text: "of use and ",
                    style: AppStyles.medium20.copyWith(
                      color: AppColors.grey888888,
                      fontSize: FontSize.s15,
                    ),
                  ),
                  TextSpan(
                    text: "privacy policy.",
                    style: AppStyles.medium20.copyWith(
                      color: AppColors.blackText,
                      fontSize: FontSize.s15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
