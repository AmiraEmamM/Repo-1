import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/core/config/resource/colors_manager.dart';

class HomeHintWidget extends StatelessWidget {
  const HomeHintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppMargin.mW20,
      ).copyWith(bottom: AppMargin.mH16),
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.pW20,
        vertical: AppPadding.pH10,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryGreen,
        borderRadius: BorderRadius.circular(AppCircular.r12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '14',
                style: AppStyles.medium13.copyWith(color: AppColors.white),
              ),
              Text(
                'Days',
                style: AppStyles.medium13.copyWith(color: AppColors.white),
              ),
            ],
          ),
          SizedBox(width: AppSize.sW10),
          Container(color: AppColors.white, width: 2.w, height: 40.h),
          SizedBox(width: AppSize.sW10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check your basil plants!',
                  style: AppStyles.medium13.copyWith(color: AppColors.white),
                ),
                Text(
                  'Today you have to water , 2 weeks for harvest',
                  style: AppStyles.regular14.copyWith(
                    color: AppColors.white,
                    fontSize: FontSize.s11,
                    fontWeight: FontWeightManager.light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
