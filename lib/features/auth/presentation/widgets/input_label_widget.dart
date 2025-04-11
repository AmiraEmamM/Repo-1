import 'package:flutter/material.dart';

import '../../../../core/config/resource/app_styles.dart';
import '../../../../core/config/resource/colors_manager.dart';

class InputLabelWidget extends StatelessWidget {
  const InputLabelWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.regular14.copyWith(color: AppColors.darkGreen),
    );
  }
}
