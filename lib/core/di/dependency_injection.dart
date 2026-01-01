import 'package:dio/dio.dart';
import 'package:doctor_reservation_app/core/networking/api_service.dart';
import 'package:doctor_reservation_app/core/networking/dio_factory.dart';
import 'package:doctor_reservation_app/features/login/data/repo/login_repo.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation_app/features/sign_up/data/repo/signup_repo.dart';
import 'package:doctor_reservation_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //Signup

  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
}
