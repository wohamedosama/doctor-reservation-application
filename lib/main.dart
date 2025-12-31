import 'package:doctor_reservation_app/core/di/dependency_injection.dart';
import 'package:doctor_reservation_app/core/routing/app_router.dart';
import 'package:doctor_reservation_app/doc_app.dart';
import 'package:doctor_reservation_app/my_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
