import 'package:doctor_reservation_app/core/helpers/doctor_images_list.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctor_list/doctors_list_view_item.dart';
import 'package:flutter/widgets.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({
    super.key,
    this.doctorsModel,
  });
  final List<Doctors?>? doctorsModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsModel?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            imageName: DoctorImagesList.getDoctorImage(),
            doctorsModel: doctorsModel?[index],
          );
        },
      ),
    );
  }
}
