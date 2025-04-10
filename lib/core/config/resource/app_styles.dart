
import 'package:flutter/material.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';

import 'colors_manager.dart';

abstract class AppStyles {
  static TextStyle bold24 = TextStyle(
    fontSize: FontSize.s24,
    fontWeight: FontWeight.w700,
    color: AppColors.labelBlack,
  );
  static TextStyle bold36 = TextStyle(
    fontSize: FontSize.s36,
    fontWeight: FontWeight.w700,
    color: AppColors.labelBlack,
  );
  static TextStyle regular14 = TextStyle(
    fontSize: FontSize.s14,
    fontWeight: FontWeight.w400,
    color: AppColors.labelBlack,
  );
  static TextStyle medium20 = TextStyle(
  fontSize: FontSize.s20,
  fontWeight: FontWeight.w500,
  color: AppColors.labelBlack,
  );
}
