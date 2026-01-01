import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.borderRadius,
    this.backgroundColor,
    this.paddingHorizontal,
    this.paddingVertical,
    this.buttonWidth,
    this.buttonHeight,
  });
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? buttonWidth;
  final double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: paddingHorizontal ?? 12.w,
            vertical: paddingVertical ?? 14.h,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(
            backgroundColor ?? AppColor.primaryColor100),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
