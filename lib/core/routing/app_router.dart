import 'package:doctor_reservation_app/core/di/dependency_injection.dart';
import 'package:doctor_reservation_app/core/routing/routes.dart';
import 'package:doctor_reservation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation_app/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation_app/features/login/presentation/screens/login_screen.dart';
import 'package:doctor_reservation_app/features/onboarding/on_boarding_screen.dart';
import 'package:doctor_reservation_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doctor_reservation_app/features/sign_up/presentation/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getSpecilazation(),
            child: const HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
