// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/specility_list/specialist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistSection extends StatefulWidget {
  final List<SpecializationsData?> specializationsData;
  const SpecialistSection({
    super.key,
    required this.specializationsData,
  });

  @override
  State<SpecialistSection> createState() => _SpecialistSectionState();
}

var selectedSpecilizationIndex = 0;

class _SpecialistSectionState extends State<SpecialistSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecilizationIndex = index;
              });
              context.read<HomeCubit>().getDoctorList(
                  specializationId: widget.specializationsData[index]?.id);
            },
            child: DoctorSpecialistItem(
              specializationsData: widget.specializationsData[index],
              itemIndex: index,
              selectedItemIndex: selectedSpecilizationIndex,
            ),
          );
        },
      ),
    );
  }
}
