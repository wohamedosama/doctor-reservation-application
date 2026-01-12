import 'dart:math';

import 'package:doctor_reservation_app/core/theme/app_images.dart';

class DoctorImagesList {
  static const List<String> doctorsImage = [
    AppImages.doctorImage1,
    AppImages.doctorImage2,
    AppImages.doctorImage3,
    AppImages.doctorImage5,
    AppImages.doctorImage7,
  ];
  static const List<String> specilizationSvgs = [
    AppImages.cardiologyyIcons,
    AppImages.gastroenterologyIcon,
    AppImages.hematologIcon,
    AppImages.gastroenterologyIcons,
    AppImages.hematologyIcon,
    AppImages.neurologyIcon,
    AppImages.medicalSpecialistIcon,
  ];

  static String getDoctorImage() {
    final random = Random();
    return doctorsImage[random.nextInt(doctorsImage.length)];
  }

  static String getSpecilityImageByIndex(int index) {
    return specilizationSvgs[index % specilizationSvgs.length];
  }
}
