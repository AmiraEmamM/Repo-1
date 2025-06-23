import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/core/config/resource/colors_manager.dart';

class HealthMentor extends StatelessWidget {
  const HealthMentor({super.key});

  @override
  Widget build(BuildContext context) {
    return const HealthMentorBody();
  }
}

class HealthMentorBody extends StatelessWidget {
  const HealthMentorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HealthMentorItem(
          color: AppColors.lightPink,
          image: AppImages.healthMentor1,
          title: 'Starwberry',
          description: 'Your plant is healthy',
          descriptionColor: AppColors.white,
          descriptionIcon: AppIcons.treeBranchIcon,
        ),
        SizedBox(height: AppSize.sH10),
         HealthMentorItem(
          color: AppColors.veryLightBlue,
          image: AppImages.healthMentor2,
          title: 'Broccoli',
          description: 'Your plant is thirsty',
          descriptionColor: const Color(0xFFCFE6ED),
          descriptionIcon: AppIcons.waterDrinkerIcon,
        ),
      ],
    );
  }
}

class HealthMentorItem extends StatelessWidget {
  const HealthMentorItem({
    super.key,
    required this.image,
    required this.color,
    required this.title,
    required this.description,
    required this.descriptionColor, required this.descriptionIcon,
  });
  final String image;
  final Color color;
  final String title;
  final String description;
  final Color descriptionColor;
  final String descriptionIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.pW20,
        vertical: AppPadding.pH14,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppCircular.r50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.bold20),
                  SizedBox(height: AppSize.sH6),
                  Text(
                    'Indoor',
                    style: AppStyles.semiBold15.copyWith(
                      color: AppColors.green476C5F,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.testBatteryIcon,
                    width: 51.w,
                    height: 31.h,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppSize.sH10),
          Text(
            'Overview',
            style: AppStyles.medium15.copyWith(color: AppColors.darkGreen),
          ),
          SizedBox(height: AppSize.sH10),
          Padding(
            padding: EdgeInsets.only(left: AppPadding.pW30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: AppSize.sH4),
                            SvgPicture.asset(AppIcons.brightnessIcon),
                            SizedBox(height: AppSize.sH4),
                            Text(
                              'Light',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.darkGreen,
                              ),
                            ),
                            SizedBox(height: AppSize.sH10),
                            Text(
                              '35-40%',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.green0D986A,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: AppSize.sW20),
                        Column(
                          children: [
                            SizedBox(height: AppSize.sH6),
                            SvgPicture.asset(AppIcons.temperatureIcon),
                            SizedBox(height: AppSize.sH6),
                            Text(
                              'TEMPERATURE',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.darkGreen,
                              ),
                            ),
                            SizedBox(height: AppSize.sH10),
                            Text(
                              '70-75',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.green0D986A,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.sH10),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: AppSize.sH4),
                            SvgPicture.asset(AppIcons.humadityIcon),
                            SizedBox(height: AppSize.sH4),
                            Text(
                              'Humidity',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.darkGreen,
                              ),
                            ),
                            SizedBox(height: AppSize.sH4),
                            Text(
                              '80%',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.green0D986A,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: AppSize.sW30),
                        Column(
                          children: [
                            SizedBox(height: AppSize.sH4),
                            SvgPicture.asset(AppIcons.waterIcon),
                            SizedBox(height: AppSize.sH4),
                            Text(
                              'WATER',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.darkGreen,
                              ),
                            ),
                            SizedBox(height: AppSize.sH4),
                            Text(
                              '250ml',
                              style: AppStyles.semiBold10.copyWith(
                                color: AppColors.green0D986A,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.sH20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.pW10,
                        vertical: AppPadding.pH6,
                      ),
                      decoration: BoxDecoration(
                        color: descriptionColor,
                        borderRadius: BorderRadius.circular(AppCircular.r8),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(descriptionIcon),
                          SizedBox(width: AppSize.sW6),
                          Text(
                            description,
                            style: AppStyles.regular14.copyWith(
                              fontSize: FontSize.s11,
                              color: AppColors.darkGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: AppSize.sW20),
                Flexible(
                  child: Image.asset(image, height: 166.h, width: 166.w),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize.sH10),
        ],
      ),
    );
  }
}
