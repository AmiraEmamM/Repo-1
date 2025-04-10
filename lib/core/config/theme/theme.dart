import 'package:flutter/material.dart';
import 'package:green_pulse/core/config/theme/extensions/material_color_extension.dart';

import '../resource/app_size.dart';
import '../resource/app_styles.dart';
import '../resource/colors_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Poppins',
      // Apply globally
      primarySwatch: AppColors.white.toMaterialColor(),
      primaryColor: AppColors.white,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.white.toMaterialColor(),
        accentColor: AppColors.primaryBlue,
        brightness: Brightness.light,
      ).copyWith(
        secondary: AppColors.white,
      ),
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.blackText,
        unselectedItemColor: AppColors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
          foregroundColor: AppColors.white,
          minimumSize: Size(AppSize.sW30, AppSize.sH30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.sH0),
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.transparent,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.white,
        selectionColor: AppColors.white.withValues(alpha: 0.2),
        selectionHandleColor: AppColors.white,
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.white,
        centerTitle: false,
        backgroundColor: AppColors.white,
        titleTextStyle: AppStyles.bold24,
        surfaceTintColor: Colors.transparent, // Prevents color change on scroll
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: AppColors.border,
      ),
      // textTheme: GoogleFonts.poppinsTextTheme(
      //   TextTheme(
      //     // This Style For AppBar Text
      //     headlineLarge: TextStyle(
      //       fontSize: FontSize.s18,
      //       // color: AppColors.secondary,
      //       fontWeight: FontWeightManager.medium,
      //     ),
      //     // This Style For Normal Text With PrimaryColor
      //     titleLarge: TextStyle(
      //       fontSize: FontSize.s13,
      //       color: AppColors.primary,
      //     ),
      //     // This Style For Normal Text With SecondryColor
      //     titleMedium: TextStyle(
      //       fontSize: FontSize.s13,
      //       color: AppColors.primary,
      //     ),
      //     // This Style For Normal Text With ThirdColor
      //     titleSmall: TextStyle(
      //       fontSize: FontSize.s13,
      //       color: AppColors.primary,
      //     ),
      //     // This Style For Hint Text
      //     bodySmall: TextStyle(
      //       fontSize: FontSize.s8,
      //       color: AppColors.hintText,
      //     ),
      //   ),
      // ),
    );
  }
}