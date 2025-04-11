import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/resource/app_size.dart';
import '../../../../core/config/resource/colors_manager.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          if (isChecked) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppCircular.r4),
          color: isChecked ? AppColors.primaryBlue : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackText.withValues(alpha: 0.25),
              blurRadius: 3.75,
              offset: const Offset(0.94, 0.94),
            ),
          ],
        ),
        child:
            isChecked
                ? SlideTransition(
                  position: _slideAnimation,
                  child: AnimatedOpacity(
                    opacity: isChecked ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 20.sp,
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}
