import 'package:doctor_reservation_app/core/widgets/custom_shimmer_loading.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctor_list/doctors_list_view_item.dart';
import 'package:flutter/material.dart';

class ShimmerEffectDoctorListView extends StatelessWidget {
  const ShimmerEffectDoctorListView({
    super.key,
    this.itemCount = 5,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const CustomShimmerLoading(
            enabled: true,
            child: DoctorsListViewItem(
              doctorsModel: null,
            ),
          );
        },
      ),
    );
  }
}
