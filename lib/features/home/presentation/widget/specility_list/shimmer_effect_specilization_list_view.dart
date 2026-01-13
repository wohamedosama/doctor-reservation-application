import 'package:doctor_reservation_app/core/widgets/custom_shimmer_loading.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/specility_list/specialist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerEffectSpecilizationListView extends StatelessWidget {
  const ShimmerEffectSpecilizationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: CustomShimmerLoading(
              enabled: true,
              child: SpecialistItem(
                specilityImage: '',
                itemIndex: index,
                selectedItemIndex: 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
