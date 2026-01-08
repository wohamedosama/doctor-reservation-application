import 'package:doctor_reservation_app/core/networking/api_error_handler.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/features/home/data/api/home_api_service.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);

  Future<ApiReuslt<SpecializationResponseModel>> getSpecilazation() async {
    try {
      final response = await _homeApiService.getSpecilazation();
      return ApiReuslt.success(response);
    } catch (error) {
      return ApiReuslt.failure(ErrorHandler.handle(error));
    }
  }
}
