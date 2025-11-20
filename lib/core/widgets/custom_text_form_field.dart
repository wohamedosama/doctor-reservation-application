import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.backgroundColor,
    required this.hintText,
    this.isObscureText,
    this.hintStyle,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
  });
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String hintText;
  final bool? isObscureText;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? errorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.font14Gray100Medium,
      obscureText: isObscureText ?? false,
      onTap: () {},
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backgroundColor ?? AppColor.grayColor10,
        hintStyle: hintStyle ?? TextStyles.font14Gray50Medium,
        hintText: hintText,
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
                color: AppColor.primaryColor100,
                width: 1.3.w,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColor.grayColor30,
                width: 1.3.w,
              ),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColor.fillRed,
                width: 1.3.w,
              ),
            ),
      ),
    );
  }
}
