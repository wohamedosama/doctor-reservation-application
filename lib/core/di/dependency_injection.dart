import 'package:dio/dio.dart';
import 'package:doctor_reservation_app/core/networking/api_service.dart';
import 'package:doctor_reservation_app/core/networking/dio_factory.dart';
import 'package:doctor_reservation_app/features/auth/data/repo/login_repo.dart';
import 'package:doctor_reservation_app/features/auth/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // home
}
