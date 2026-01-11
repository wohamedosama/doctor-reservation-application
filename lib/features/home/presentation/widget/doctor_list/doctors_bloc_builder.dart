import 'package:doctor_reservation_app/core/widgets/custom_loading_indicator.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctor_list/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is DoctorsLoading ||
            current is DoctorsSuccess ||
            current is DoctorsFailure,
        builder: (context, state) {
          return state.maybeWhen(
            doctorsLoading: () => const CustomLoadingDialog(),
            doctorsSuccess: (docotrdModelList) {
              var doctorsList = docotrdModelList;
              return setupSpecializationSuccess(doctorsList);
            },
            doctorsFailure: (error) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        });
  }
}

Widget setupSpecializationSuccess(doctorsList) {
  return DoctorsListView(doctorsModel: doctorsList ?? []);
}

Widget setupError() {
  return const SizedBox.shrink();
}
