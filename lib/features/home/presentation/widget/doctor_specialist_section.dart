// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctor_specialist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialistSection extends StatelessWidget {
  final List<SpecializationsData?> specializationsData;
  const DoctorSpecialistSection({
    super.key,
    required this.specializationsData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DoctorSpecialistItem(
            specializationsData: specializationsData[index],
            itemIndex: index,
          );
        },
        itemCount: specializationsData.length,
      ),
    );
  }
}
