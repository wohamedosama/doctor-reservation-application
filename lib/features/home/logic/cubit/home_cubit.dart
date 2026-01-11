import 'package:bloc/bloc.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/features/home/data/repo/home_repo.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecilazation() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecilazation();
    response.when(
      success: (specializationResponseModel) {
        emit(HomeState.specializationSuccess(
            specializationResponseModel.specializationsData));
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
        emit(HomeState.doctorsSuccess(doctorsResponseModel.docotrsModel));
      },
      failure: (error) {
        emit(HomeState.doctorsFailure(error));
      },
    );
  }
}
