import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialistItem extends StatelessWidget {
  const SpecialistItem({
    super.key,
    required this.itemIndex,
    this.specializationsData,
    required this.selectedItemIndex,
    required this.specilityImage,
  });
  final int itemIndex;
  final String specilityImage;
  final SpecializationsData? specializationsData;
  final int selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedItemIndex
              ? Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColor.grayColor100, width: 2.5),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28.r,
                    backgroundColor: AppColor.grayColor30,
                    child: _buildImage(42.h, 42.w),
                  ),
                )
              : CircleAvatar(
                  radius: 28.r,
                  backgroundColor: AppColor.grayColor30,
                  child: _buildImage(40.h, 40.w),
                ),
          verticalSpace(8),
          Text(
            specializationsData?.specialityCatgory ?? 'General',
            style: itemIndex == selectedItemIndex
                ? TextStyles.font14Gray100Bold
                : TextStyles.font12Gray100Regular,
          ),
        ],
      ),
    );
  }

  Widget _buildImage(double height, double width) {
    if (specilityImage.isEmpty) {
      return Icon(
        Icons.medical_services_outlined,
        size: height * 0.7,
        color: AppColor.grayColor100,
      );
    }

    return SvgPicture.asset(
      specilityImage,
      height: height,
      width: width,
    );
  }
}
