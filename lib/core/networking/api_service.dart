import 'package:dio/dio.dart';
import 'package:doctor_reservation_app/core/networking/api_constant.dart';
import 'package:doctor_reservation_app/features/auth/data/model/login_request_body.dart';
import 'package:doctor_reservation_app/features/auth/data/model/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstant.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
