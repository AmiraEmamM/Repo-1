import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/resource/app_size.dart';
import '../../../config/resource/app_styles.dart';
import '../../../config/resource/colors_manager.dart';

class DefaultTextField extends StatefulWidget {
  final String? title;
  final bool secure;
  final TextInputType inputType;
  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final String? label;
  final Function(String?)? onSubmitted;
  final Color? fillColor;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool filled;
  final int? maxLength;
  final Color? labelColor;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final GestureTapCallback? onTap;
  final String? suffixText;
  final TextInputAction action;
  final bool autoFocus;
  final double? radius;
  final FocusNode? focusNode;
  final Widget? prefixWidget;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool? isPassword;
  final int? maxLines;
  final bool? hasBorderColor;
  final bool? enabled;
  final Color? borderColor;
  final void Function(String?)? onChanged;
  final bool closeWhenTapOutSide;
  final TextStyle? style;
  final TextStyle? hintStyle;
  const DefaultTextField({
    super.key,
    this.title,
    this.enabled,
    this.radius,
    this.secure = false,
    this.hintStyle,
    this.inputType = TextInputType.text,
    this.borderColor,
    this.onTap,
    this.controller,
    this.contentPadding,
    this.closeWhenTapOutSide = true,
    this.hasBorderColor = true,
    this.validator,
    this.label,
    this.onSubmitted,
    this.isPassword = false,
    this.fillColor,
    this.inputFormatters,
    this.prefixIcon,
    this.prefixWidget,
    this.maxLength,
    this.filled = true,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.action = TextInputAction.next,
    this.focusNode,
    this.autoFocus = false,
    this.suffixText,
    this.suffixIcon,
    this.maxLines,
    this.onChanged,
    this.style,
    this.labelColor,
    this.focusedBorder, this.enabledBorder,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late bool _isSecure;

  @override
  void initState() {
    if (widget.isPassword != null) {
      _isSecure = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLabel = widget.label != null;
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.isPassword == true ? _isSecure : widget.secure,
      onTap: widget.onTap,
      onTapOutside: (event) {
        if (widget.closeWhenTapOutSide == true) {
          FocusScope.of(context).unfocus();
        }
      },
      keyboardType: widget.inputType,
      autofillHints: _getAutoFillHints(widget.inputType),
      validator: widget.validator,
      maxLength: widget.maxLength,
      readOnly: widget.onTap != null ? true : widget.readOnly,
      textAlign: widget.textAlign!,
      maxLines:
          widget.inputType == TextInputType.multiline
              ? widget.maxLines ?? 7
              : 1,
      style: widget.style,
      onFieldSubmitted: widget.onSubmitted,
      textInputAction: widget.action,
      enableSuggestions: false,
      autocorrect: false,
      autofocus: widget.autoFocus,
      focusNode: widget.autoFocus == true ? widget.focusNode : null,
      cursorColor: AppColors.primaryBlue,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        counterText: '',
        filled: widget.filled,
        suffixText: widget.suffixText,
        prefixIcon:
        widget.prefixIcon,
        suffixIcon:
            widget.isPassword == true
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isSecure = !_isSecure;
                    });
                  },
                  icon: Icon(
                    _isSecure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.darkGreen,
                    size: 22.sp,
                  ),
                )
                : widget.suffixIcon,
        prefix: widget.prefixWidget,
        fillColor: widget.fillColor ?? Colors.white,
        hintText: widget.title,
        label: isLabel ? Text(widget.label!) : null,
        labelStyle: isLabel ? TextStyle(color: widget.labelColor) : null,
        enabled: widget.enabled ?? true,
        hintStyle:
            widget.hintStyle ??
            AppStyles.regular14.copyWith(color: AppColors.grey),
        enabledBorder: widget.enabledBorder?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? AppCircular.r10),
          borderSide:
              widget.hasBorderColor == true
                  ? BorderSide(color: widget.borderColor ?? AppColors.border)
                  : BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? AppCircular.r4),
          borderSide:
              widget.hasBorderColor == true
                  ? BorderSide(color: widget.borderColor ?? AppColors.border)
                  : BorderSide.none,
        ),
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCircular.r10),
              borderSide: const BorderSide(color: AppColors.blurColor),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCircular.r10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCircular.r10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

List<String> _getAutoFillHints(TextInputType inputType) {
  if (inputType == TextInputType.emailAddress) {
    return [AutofillHints.email];
  } else if (inputType == TextInputType.datetime) {
    return [AutofillHints.birthday];
  } else if (inputType == TextInputType.phone) {
    return [AutofillHints.telephoneNumber];
  } else if (inputType == TextInputType.url) {
    return [AutofillHints.url];
  }
  return [AutofillHints.name, AutofillHints.username];
}
