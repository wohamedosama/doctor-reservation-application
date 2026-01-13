import 'package:doctor_reservation_app/core/helpers/constant.dart';
import 'package:doctor_reservation_app/core/helpers/shared_pref_helper.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/core/networking/dio_factory.dart';
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

  LoginCubit(this._loginRepo) : super(const LoginState.loginInitial());
  void emitLoginState() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        emailController.text,
        passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userData?.token ?? '');
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (apiErrorModel) => emit(LoginState.loginFailure(apiErrorModel)),
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPreKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
