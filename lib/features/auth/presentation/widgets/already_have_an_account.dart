import 'package:flutter/material.dart';

import '../../../../core/config/resource/app_size.dart';
import '../../../../core/config/resource/app_styles.dart';
import '../../../../core/config/resource/colors_manager.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: AppStyles.regular15.copyWith(
            color: AppColors.grey888888,
          ),
        ),
        SizedBox(width: AppSize.sW4),
        GestureDetector(
          onTap: () {
            // Navigate to the login screen
          },
          child: Text(
            'Login',
            style:AppStyles.regular15.copyWith(
              color: AppColors.darkGreen,
            ),
          ),
        ),
      ],
    );
  }
}
