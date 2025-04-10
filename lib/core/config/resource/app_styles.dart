
import 'package:flutter/material.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';

import 'colors_manager.dart';

abstract class AppStyles {
  static TextStyle bold24 = TextStyle(
    fontSize: FontSize.s24,
    fontWeight: FontWeight.w700,
    color: AppColors.labelBlack,
  );
}
