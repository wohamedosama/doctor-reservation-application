import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/app_images.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecialistItem extends StatelessWidget {
  const DoctorSpecialistItem(
      {super.key, required this.itemIndex, this.specializationsData});
  final int itemIndex;
  final SpecializationsData? specializationsData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColor.grayColor30,
            child: SvgPicture.asset(AppImages.doctorIcon),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.specialityCatgory ?? 'Genral',
            style: TextStyles.font12Gray100Regular,
          ),
        ],
      ),
    );
  }
}
