import 'package:bloc/bloc.dart';
import 'package:doctor_reservation_app/core/networking/api_error_handler.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/features/home/data/model/doctors_response_model.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:doctor_reservation_app/features/home/data/repo/home_repo.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specilizationList = [];
  List<DocotrsModel?>? allDoctorsList = [];

  void getSpecilazation() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecilazation();
    response.when(
      success: (specializationResponseModel) {
        specilizationList =
            specializationResponseModel.specializationsData ?? [];
        emit(HomeState.specializationSuccess(
            specializationResponseModel.specializationsData));
        // Load all doctors first, then filter by first specialization
        getAllDoctors();
      },
      failure: (error) {
        emit(HomeState.specializationFailure(error));
      },
    );
  }

  void getAllDoctors() async {
    emit(const HomeState.doctorsLoading());
    final response = await _homeRepo.getAllDocotor();

    response.when(
      success: (doctorsResponseModel) {
        allDoctorsList = doctorsResponseModel.docotrsModel ?? [];
        // Filter by first specialization if available
        if (specilizationList?.isNotEmpty == true) {
          getDoctorList(specializationId: specilizationList?.first?.id);
        } else {
          emit(HomeState.doctorsSuccess(allDoctorsList));
        }
      },
      failure: (error) {
        emit(HomeState.doctorsFailure(error));
      },
    );
  }

  void getDoctorList({required int? specializationId}) {
    if (allDoctorsList == null || allDoctorsList!.isEmpty) {
      // If doctors list is not loaded yet, load it first
      getAllDoctors();
      return;
    }

    // Filter doctors by specialization ID
    List<DocotrsModel?>? filteredDoctors = allDoctorsList
        ?.where((doctor) => doctor?.specialization?.id == specializationId)
        .toList();

    if (filteredDoctors != null && filteredDoctors.isNotEmpty) {
      // Emit DoctorsSuccess so the existing DoctorsBlocBuilder can handle it
      emit(HomeState.doctorsSuccess(filteredDoctors));
    } else {
      emit(HomeState.doctorsFailure(ErrorHandler.handle('No Doctor Found')));
    }
  }

  getDoctorsListBySpecializationId(specializationId) {
    return specilizationList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsModel;
  }
}
