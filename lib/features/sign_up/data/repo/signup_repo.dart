import 'package:doctor_reservation_app/core/networking/api_error_handler.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/core/networking/api_service.dart';
import 'package:doctor_reservation_app/features/sign_up/data/model/signup_request_body.dart';
import 'package:doctor_reservation_app/features/sign_up/data/model/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;
  const SignupRepo(this._apiService);

  Future<ApiReuslt<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiReuslt.success(response);
    } catch (error) {
      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }
}
