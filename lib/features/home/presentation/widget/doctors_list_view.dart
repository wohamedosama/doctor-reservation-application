import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/app_images.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.grayColor20,
                    ),
                    child: Image.asset(
                      width: 110.w,
                      height: 120.h,
                      AppImages.doctorCarton,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Randy Wigham',
                        style: TextStyles.font16GrayColor100Bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        'General | 01149060781',
                        style: TextStyles.font12Gray70Regular,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        'Email@gmail.com',
                        style: TextStyles.font12Gray70Regular,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
