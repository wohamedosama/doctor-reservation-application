import 'package:doctor_reservation_app/features/home/data/model/doctors_response_model.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctor_list/doctors_list_view_item.dart';
import 'package:flutter/widgets.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, this.doctorsModel});
  final List<DocotrsModel?>? doctorsModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsModel?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorsModel: doctorsModel?[index],
          );
        },
      ),
    );
  }
}
