import 'package:doctor_reservation_app/core/networking/api_error_handler.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/core/networking/api_service.dart';
import 'package:doctor_reservation_app/features/login/data/model/login_request_body.dart';
import 'package:doctor_reservation_app/features/login/data/model/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiReuslt<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiReuslt.success(response);
    } catch (error) {
      return ApiReuslt.failure(ErrorHandler.handle(error));
    }
  }
}
