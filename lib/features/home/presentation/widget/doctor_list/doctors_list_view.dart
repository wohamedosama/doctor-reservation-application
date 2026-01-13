import 'package:doctor_reservation_app/core/helpers/doctor_images_list.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctor_list/doctors_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({
    super.key,
    this.doctorsModel,
    this.isLoading = false,
  });
  final List<Doctors?>? doctorsModel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: isLoading,
        child: ListView.builder(
          itemCount: isLoading ? 5 : (doctorsModel?.length ?? 0),
          itemBuilder: (context, index) {
            return DoctorsListViewItem(
              imageName: isLoading ? '' : DoctorImagesList.getDoctorImage(),
              doctorsModel:
                  isLoading ? _getDummyDoctor() : doctorsModel?[index],
            );
          },
        ),
      ),
    );
  }

  Doctors _getDummyDoctor() {
    return Doctors(
      name: 'Doctor Name Here',
      degree: 'Specialization Degree',
      phone: '01234567890',
      email: 'doctor@example.com',
      // Add any other required fields from your Doctors model
      // Use realistic dummy text to make skeleton look good
    );
  }
}
