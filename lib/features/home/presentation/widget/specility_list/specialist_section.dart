import 'package:doctor_reservation_app/core/helpers/doctor_images_list.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/specility_list/specialist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SpecialistSection extends StatefulWidget {
  final List<SpecializationsData?>? specializationsData;

  const SpecialistSection({
    super.key,
    this.specializationsData,
    this.isLoading = false,
  });
  final bool isLoading;
  @override
  State<SpecialistSection> createState() => _SpecialistSectionState();
}

var selectedSpecilizationIndex = 0;

class _SpecialistSectionState extends State<SpecialistSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Skeletonizer(
        enabled: widget.isLoading,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              widget.isLoading ? 5 : (widget.specializationsData?.length ?? 0),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: widget.isLoading
                  ? null
                  : () {
                      setState(() {
                        selectedSpecilizationIndex = index;
                      });
                      context.read<HomeCubit>().getDoctorList(
                          specializationId:
                              widget.specializationsData?[index]?.id);
                    },
              child: SpecialistItem(
                specilityImage: widget.isLoading
                    ? ''
                    : DoctorImagesList.getSpecilityImageByIndex(index),
                specializationsData: widget.isLoading
                    ? _getDummySpecialization()
                    : widget.specializationsData?[index],
                itemIndex: index,
                selectedItemIndex: selectedSpecilizationIndex,
              ),
            );
          },
        ),
      ),
    );
  }

  SpecializationsData _getDummySpecialization() {
    return SpecializationsData(
      id: 0,
      specialityCatgory: 'Specialization Name',
    );
  }
}
