import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/widgets/custom_loading_indicator.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctor_specialist_section.dart';
import 'package:doctor_reservation_app/features/home/presentation/widget/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBlocBuilderWidget extends StatelessWidget {
  const HomeScreenBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationFailure,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () => const CustomLoadingDialog(),
          specializationSuccess: (specializationResponseModel) =>
              setupSpecializationSuccess(specializationResponseModel),
          specializationFailure: () => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSpecializationSuccess(
      SpecializationResponseModel specializationResponseModel) {
    var specializationsList = specializationResponseModel.specializationsData;
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialistSection(
              specializationsData: specializationsList ?? []),
          verticalSpace(12),
          DoctorsListView(
            doctorsModel: specializationsList?[0]?.doctorsModel,
          ),
        ],
      ),
    );
  }
}

Widget setupError() {
  return const SizedBox.shrink();
}

Widget setupLoadingIndicator() {
  return const SizedBox(
    height: 100,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
