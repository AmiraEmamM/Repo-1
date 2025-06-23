import 'package:flutter/material.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.cameraImageScreen,
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    );
  }
}
