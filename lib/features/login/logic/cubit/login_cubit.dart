import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/features/login/data/model/login_request_body.dart';
import 'package:doctor_reservation_app/features/login/data/repo/login_repo.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        emailController.text,
        passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) => emit(LoginState.success(loginResponse)),
      failure: (error) => emit(LoginState.failure(
          error.apiErrorModel.message ?? "SignupRequestBody")),
    );
  }
}
