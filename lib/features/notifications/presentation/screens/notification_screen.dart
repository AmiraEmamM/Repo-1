import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';
import 'package:green_pulse/core/config/resource/colors_manager.dart';

import '../../../../core/shared/widgets/app_title_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppTitleWidget()),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sW20,
          vertical: AppSize.sH20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: AppStyles.bold20.copyWith(
                fontSize: FontSize.s18,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return NotificationListItem(
                    model: notifications[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({super.key, required this.model});
  final NotificationItemModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppMargin.mH16),
      child: Row(
        children: [
          if (model.icon.contains('.svg'))
            SvgPicture.asset(model.icon)
          else
            Image.asset(model.icon,width:65.w ,height: 65.h,),
          SizedBox(width: 22.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: AppStyles.regular14.copyWith(fontSize: FontSize.s12),
              ),
              SizedBox(height: 11.h),
              Text(
                model.time,
                style: AppStyles.medium13.copyWith(
                  fontSize: FontSize.s11,
                  color: AppColors.greenForNotification,
                ),
              ),

            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4,vertical: AppPadding.pH4),
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.green0D986A,
            ),
            child: Text(model.count,style: AppStyles.bold20.copyWith(
              fontSize: FontSize.s10,
              color: AppColors.white,
            ),),
          )
        ],
      ),
    );
  }
}

class NotificationItemModel {
  final String icon;
  final String count;
  final String title;
  final String time;

  NotificationItemModel({
    required this.icon,
    required this.count,
    required this.title,
    required this.time,
  });

  // Example data
}

List<NotificationItemModel> notifications = [
  NotificationItemModel(
    icon: AppIcons.notificationCart,
    count: '1',
    title: 'Order #5542 Placed',
    time: '1m ago.',
  ),
  NotificationItemModel(
    icon: AppImages.truck,
    count: '1',
    title: 'Order #5541 arriving today',
    time: '30m ago',
  ),
  NotificationItemModel(
    icon: AppIcons.boxIcon,
    count: '1',
    title: 'Order #5540 received',
    time: '10h ago.',
  ),
  NotificationItemModel(
    icon: AppImages.branch,
    count: '2',
    title: 'Monstera Adansonii looks health',
    time: 'Today',
  ),
  NotificationItemModel(
    icon: AppImages.plant,
    count: '2',
    title: 'Janda Bolong is thirsty',
    time: 'Today',
  ),
];
