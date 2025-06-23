import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_pulse/core/config/navigation/navigator.dart';
import 'package:green_pulse/core/shared/validators.dart';
import 'package:green_pulse/features/auth/presentation/screens/login_screen.dart';
import 'package:green_pulse/features/auth/presentation/widgets/terms_and_conditions_widget.dart';

import '../../../../core/config/resource/app_size.dart';
import '../../../../core/config/resource/colors_manager.dart';
import '../../../../core/shared/shared_pref_services.dart';
import '../../../../core/shared/widgets/buttons/loading_button.dart';
import '../../../../core/shared/widgets/text_fields/default_text_field.dart';
import 'input_label_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool acceptTerms = false;
  Future<void> onSignUp() async {
    if (!acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must accept terms and conditions")),
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      final isTaken = await SharedPrefService.isUsernameTaken(username);

      if (isTaken) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Username already registered")),
        );
        return;
      }

      await SharedPrefService.saveUser(username, password);

      Go.offAll(const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.sH30),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputLabelWidget(title: 'Username'),
            SizedBox(height: AppSize.sH4),
            DefaultTextField(
              labelColor: AppColors.darkGreen,
              title: 'Enter Username',
              borderColor: AppColors.blurColor,
              controller: usernameController,
              validator: Validators.validateUserName,
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.sH14,
                horizontal: AppSize.sH16,
              ),
            ),
            SizedBox(height: AppSize.sH14),
            const InputLabelWidget(title: 'Password'),
            SizedBox(height: AppSize.sH4),
            DefaultTextField(
              labelColor: AppColors.darkGreen,
              controller: passwordController,
              validator: Validators.validatePassword,
              borderColor: AppColors.blurColor,
              isPassword: true,
              title: "Enter Password",
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.sH14,
                horizontal: AppSize.sH16,
              ),
            ),
            SizedBox(height: AppSize.sH14),
            const InputLabelWidget(title: 'Confirm Password'),
            SizedBox(height: AppSize.sH4),
            DefaultTextField(
              labelColor: AppColors.darkGreen,
              borderColor: AppColors.blurColor,
              controller: confirmPasswordController,
              validator: (value) {
                return Validators.validateConfirmPassword(
                  passwordController.text,
                  value,
                );
              },
              isPassword: true,
              title: "Confirm Password",
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.sH14,
                horizontal: AppSize.sH16,
              ),
            ),
            SizedBox(height: AppSize.sH20),
             TermsAndConditionsWidget(
              isChecked: acceptTerms,
              onTap: () {
                setState(() {
                  acceptTerms = !acceptTerms;
                });
              },
             ),
            SizedBox(height: AppSize.sH30),
            LoadingButton(
              color: AppColors.blue2D53EB,
              title: 'SIGN UP',
              borderRadius: 11.25.sp,
              onTap: () async {
                await onSignUp();
              },
            ),
            SizedBox(height: AppSize.sH12),
          ],
        ),
      ),
    );
  }
}
