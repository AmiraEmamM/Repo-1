import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/resource/app_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 33.h),
      child: SizedBox(
        width: .3.sh,
        child: Text(
          'select your plants for hydrponics!',
          style: AppStyles.medium20.copyWith(fontSize: 24.sp),
        ),
      ),
    );
  }
}
