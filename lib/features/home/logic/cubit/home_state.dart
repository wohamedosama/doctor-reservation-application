import 'package:doctor_reservation_app/core/networking/api_error_handler.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  // Specialization
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
          List<SpecializationsData?>? specializationDataList) =
      SpecializationSuccess;
  const factory HomeState.specializationFailure(ErrorHandler error) =
      SpecializationFailure;

  // Doctors
  const factory HomeState.doctorsLoading() = DoctorsLoading;
  const factory HomeState.doctorsSuccess(List<Doctors?>? docotrdModelList) =
      DoctorsSuccess;
  const factory HomeState.doctorsFailure(ErrorHandler error) = DoctorsFailure;
}
