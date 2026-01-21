import 'package:doctor_reservation_app/core/di/dependency_injection.dart';
import 'package:doctor_reservation_app/core/helpers/constant.dart';
import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/helpers/shared_pref_helper.dart';
import 'package:doctor_reservation_app/core/routing/app_router.dart';
import 'package:doctor_reservation_app/core/widgets/error_widget.dart';
import 'package:doctor_reservation_app/doc_app.dart';
import 'package:doctor_reservation_app/my_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Replaces the default red ErrorWidget when a widget's build() throws.
  // Does NOT catch: initState, async/Future, or event handler exceptions.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorScreenWidget(
      errorMessage: details.exception.toString(),
    );
  };

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
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPreKeys.userToken);
  userToken.isNullOrEmpty() ? isLoggedInUser = false : isLoggedInUser = true;
}
