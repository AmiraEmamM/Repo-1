import 'package:flutter/material.dart';

import '../../config/resource/app_styles.dart';
import '../../config/resource/colors_manager.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Green ",
              style: AppStyles.bold27.copyWith(
                color: AppColors.primaryGreen,
              ),
            ),
            TextSpan(
              text: "Pulse",
              style: AppStyles.bold27.copyWith(
                color: AppColors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
