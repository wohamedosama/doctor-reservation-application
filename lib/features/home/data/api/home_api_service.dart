import 'package:dio/dio.dart';
import 'package:doctor_reservation_app/core/networking/api_constant.dart';
import 'package:doctor_reservation_app/features/home/data/api/home_api_constant.dart';
import 'package:doctor_reservation_app/features/home/data/model/specialization_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;
  // Return Small List including the doctors and speciality
  @GET(HomeApiConstant.specializationEndPoint)
  Future<SpecializationResponseModel> getSpecilazation();

  // // Return all doctors list
  // @GET(HomeApiConstant.allDoctorsEndPoint)
  // Future<DoctorsResponseModel> getAllDocotor();
}
