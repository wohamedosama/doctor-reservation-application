import 'package:dio/dio.dart';
import 'package:doctor_reservation_app/core/networking/api_constant.dart';
import 'package:doctor_reservation_app/features/home/data/api/home_api_constant.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstant.specializationEndPoint)
  Future<SpecializationResponseModel> getSpecilazation();
}
