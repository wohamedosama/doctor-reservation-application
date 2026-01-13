import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomShimmerLoading extends StatelessWidget {
  const CustomShimmerLoading({
    super.key,
    required this.child,
    required this.enabled,
    this.ignoreContainers,
    this.duration,
  });
  final Widget child;
  final bool enabled;
  final bool? ignoreContainers;
  final int? duration;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: AppColor.grayColor40,
      ignoreContainers: ignoreContainers ?? false,
      enabled: enabled,
      effect: ShimmerEffect(
        baseColor: AppColor.grayColor40,
        highlightColor: AppColor.grayColor50,
        duration: Duration(seconds: duration ?? 2),
      ),
      child: child,
    );
  }
}
