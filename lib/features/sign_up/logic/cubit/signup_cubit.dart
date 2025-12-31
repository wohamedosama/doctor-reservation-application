import 'package:bloc/bloc.dart';
import 'package:doctor_reservation_app/core/networking/api_reuslt.dart';
import 'package:doctor_reservation_app/features/sign_up/data/model/signup_request_body.dart';
import 'package:doctor_reservation_app/features/sign_up/data/repo/signup_repo.dart';
import 'package:doctor_reservation_app/features/sign_up/logic/cubit/signup_state.dart';
import 'package:flutter/cupertino.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  SignupCubit(this._signupRepo) : super(const SignupState.initial());
  void emitSignupState() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(
        success: (loginResponse) => emit(SignupState.success(loginResponse)),
        failure: (error) =>
            emit(SignupState.failure(error.apiErrorModel.message ?? '')));
  }
}
