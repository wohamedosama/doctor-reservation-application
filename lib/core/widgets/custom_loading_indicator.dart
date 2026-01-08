import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: AppColor.primaryColor100,
          size: size ?? 60,
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const CustomLoadingDialog(),
  );
}
