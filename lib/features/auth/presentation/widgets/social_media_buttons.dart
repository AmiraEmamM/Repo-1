import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/resource/app_assets.dart';
import '../../../../core/config/resource/app_size.dart';
import '../../../../core/config/resource/app_styles.dart';
import '../../../../core/config/resource/colors_manager.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.sH30),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppCircular.r12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackText.withValues(alpha: .25),
                    blurRadius: 3.75,
                    offset: const Offset(0.94, 0.94),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pW15,
                vertical: AppPadding.pH15,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.googleIcon),
                  SizedBox(width: AppSize.sW4),
                  Text(
                    'Google',
                    style: AppStyles.medium20.copyWith(
                      fontSize: FontSize.s16,
                      color: AppColors.blackText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: AppSize.sW16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.faceBookColor,
                borderRadius: BorderRadius.circular(AppCircular.r12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackText.withValues(alpha: .25),
                    blurRadius: 3.75,
                    offset: const Offset(0.94, 0.94),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pW15,
                vertical: AppPadding.pH15,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.facebookIcon),
                  SizedBox(width: AppSize.sW4),
                  Text(
                    'Facebook',
                    style: AppStyles.medium20.copyWith(
                      fontSize: FontSize.s16,
                      color: AppColors.white,
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
