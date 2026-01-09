import 'package:doctor_reservation_app/core/di/dependency_injection.dart';
import 'package:doctor_reservation_app/core/helpers/constant.dart';
import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/helpers/shared_pref_helper.dart';
import 'package:doctor_reservation_app/core/routing/app_router.dart';
import 'package:doctor_reservation_app/doc_app.dart';
import 'package:doctor_reservation_app/my_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This is line written to handle the text's issue in the release mode while using screen_utls package
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  await checkIfLoggedInUser();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getString(SharedPreKeys.userToken);
  userToken.isNullOrEmpty() ? isLoggedInUser = false : isLoggedInUser = true;
}
