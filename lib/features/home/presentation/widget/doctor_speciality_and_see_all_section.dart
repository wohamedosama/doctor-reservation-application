import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityAndSeeAllSection extends StatelessWidget {
  const DoctorSpecialityAndSeeAllSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18GrayColor100SemiBold,
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyles.font12PrimaryRegular,
        ),
      ],
    );
  }
}
