import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_pulse/core/config/navigation/navigator.dart';
import 'package:green_pulse/features/notifications/presentation/screens/notification_screen.dart';

import '../../../../core/config/resource/app_assets.dart';
import '../../../../core/shared/widgets/app_title_widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 20.0.w),
          child: InkWell(
            onTap: (){
              Go.to( const NotificationScreen());
            },
            child: SvgPicture.asset(
              AppIcons.notificationIcon,
              height: 28.h,
              width: 19.w,
            ),
          ),
        ),
      ],
      title: const AppTitleWidget(),
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: 25.0.w),
        child: SvgPicture.asset(
          AppIcons.menuIcon,
          height: 16.h,
          width: 16.w,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
