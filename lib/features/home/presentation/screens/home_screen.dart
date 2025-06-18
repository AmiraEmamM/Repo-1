import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/core/config/resource/colors_manager.dart';

import '../../models/home_product_model.dart';
import '../widgets/home_header.dart';
import '../widgets/home_hint_widget.dart';
import '../widgets/home_list_view_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const HomeHintWidget(),
          SizedBox(height: AppSize.sH14),
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: 200.0, // Set a height
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(AppImages.homeImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 17.h,
                right: 30.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.pW12,
                    vertical: AppPadding.pH14,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: .8),
                    borderRadius: BorderRadius.circular(AppCircular.r30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'see Details',
                        style: AppStyles.medium13.copyWith(
                          color: AppColors.greenSecondary,
                        ),
                      ),
                      SizedBox(width: AppSize.sW8),
                      SvgPicture.asset(AppIcons.forWardIcon),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.sH16),
          Padding(
            padding: EdgeInsets.only(left: 26.0.w),
            child: Text(
              'Recommendation',
              style: AppStyles.regular15.copyWith(fontSize: FontSize.s16),
            ),
          ),
          SizedBox(height: AppSize.sH16),
          Container(
            margin: EdgeInsetsDirectional.only(start: 26.w),
            height: 190.h,
            child: ListView.builder(
              itemCount: homeProducts.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return HomeListViewItem(homeProductModel: homeProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

