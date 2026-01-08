import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/app_images.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSpecialistSection extends StatelessWidget {
  const DoctorSpecialistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: AppColor.grayColor30,
                  child: SvgPicture.asset(AppImages.doctorIcon),
                ),
                verticalSpace(8),
                Text(
                  'General',
                  style: TextStyles.font12Gray100Regular,
                ),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
