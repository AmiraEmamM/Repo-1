import 'package:flutter/material.dart';

import '../../../config/navigation/navigator.dart';
import '../../../config/resource/app_size.dart';
import '../../../config/resource/colors_manager.dart';

class ButtonClose extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonClose({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Go.back(),
      child: Container(
        height: AppSize.sH25,
        width: AppSize.sW25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppCircular.r20),
        ),
        child: Center(
          child: Icon(
            Icons.close,
            color: AppColors.blackText,
            size: AppSize.sH25,
          ),
        ),
      ),
    );
  }
}
