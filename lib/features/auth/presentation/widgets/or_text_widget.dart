import 'package:flutter/material.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';

import '../../../../core/config/resource/colors_manager.dart';

class OrTextWidget extends StatelessWidget {
  const OrTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.dividerColor,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'or sign up with',
            style: AppStyles.regular14.copyWith(
              color: AppColors.grey444444,
              fontSize: FontSize.s15,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.dividerColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
