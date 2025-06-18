import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/resource/app_assets.dart';
import '../../../../core/config/resource/app_size.dart';
import '../../../../core/config/resource/app_styles.dart';
import '../../../../core/config/resource/colors_manager.dart';
import '../../models/home_product_model.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({super.key, required this.homeProductModel});
  final HomeProductModel homeProductModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157.w,
      height: 158.h,
      margin: EdgeInsets.only(right: 13.w),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(AppCircular.r21),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Image positioned at the top, partially outside the card
          Positioned(
            top: -20.h,
            left: -10.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70.r),
              child: Image.asset(
                homeProductModel.image,
                width: 140.w,
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Bottom info and icon
          Positioned(
            bottom: 10.h,
            left: 13.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Title & Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeProductModel.title,
                      style: AppStyles.medium16,
                    ),
                    Text(
                      homeProductModel.description,
                      style: AppStyles.light12.copyWith(
                        color: AppColors.veryLightGreen,
                      ),
                    ),
                  ],
                ),
                // Favorite Icon
                IconButton(
                  icon: SvgPicture.asset(AppIcons.favoriteIcon),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
