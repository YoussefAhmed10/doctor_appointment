import 'package:doctor_appointement_project/core/theming/colors.dart';
import 'package:doctor_appointement_project/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextstyle;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Color? backGroundFillColor;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.inputTextstyle,
    required this.hintText,
    this.suffixIcon,
    this.isObscureText,
    this.backGroundFillColor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3.w,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3.w,
              ),
            ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText ?? '',
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backGroundFillColor ?? ColorsManager.moreLightGray,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextstyle ?? TextStyles.font14DarkBlueMedium,
    );
  }
}
