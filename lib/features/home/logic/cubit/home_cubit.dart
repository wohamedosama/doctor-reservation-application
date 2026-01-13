import 'package:bloc/bloc.dart';
import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/data/repo/home_repo.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specilizationList = [];

  void getSpecilazation() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecilazation();
    response.when(
      success: (specializationResponseModel) {
        specilizationList =
            specializationResponseModel.specializationsData ?? [];
        getDoctorList(specializationId: specilizationList?.first?.id);

        emit(HomeState.specializationSuccess(
            specializationResponseModel.specializationsData));
      },
      failure: (apiErrorModel) {
        emit(HomeState.specializationFailure(apiErrorModel));
      },
    );
  }

  void getDoctorList({required int? specializationId}) async {
    emit(const HomeState.doctorsLoading());
    await Future.delayed(const Duration(milliseconds: 800));

    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(const HomeState.doctorsFailure());
    }
  }

  getDoctorsListBySpecializationId(specializationId) {
    return specilizationList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsModel;
  }
}
