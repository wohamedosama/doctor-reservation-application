import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  final String? imageName;
  const DoctorsListViewItem({
    super.key,
    this.doctorsModel,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 110.w,
              height: 120.h,
              decoration: const BoxDecoration(
                color: AppColor.grayColor20,
              ),
              child: _buildDoctorImage(),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name ?? "Mohamed Osama",
                  style: TextStyles.font16GrayColor100Bold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  "${doctorsModel?.gender ?? "Male"} | ${doctorsModel?.phone ?? "+201149060781"}",
                  style: TextStyles.font12Gray70Regular,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  doctorsModel?.email ?? "wohamedosama@gmail.com",
                  style: TextStyles.font12Gray70Regular,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorImage() {
    if (imageName.isNullOrEmpty()) {
      return const Center(
        child: Icon(
          Icons.person,
          size: 50,
          color: AppColor.grayColor100,
        ),
      );
    }

    return Image.asset(
      imageName!,
      width: 110.w,
      height: 120.h,
      fit: BoxFit.fitHeight,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(
            Icons.person,
            size: 50,
            color: AppColor.grayColor100,
          ),
        );
      },
    );
  }
}
