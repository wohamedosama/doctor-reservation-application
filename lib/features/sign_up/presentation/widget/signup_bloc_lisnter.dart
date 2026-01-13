import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/helpers/flutter_toast.dart';
import 'package:doctor_reservation_app/core/networking/api_error_model.dart';
import 'package:doctor_reservation_app/core/routing/routes.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/core/widgets/custom_loading_indicator.dart';
import 'package:doctor_reservation_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doctor_reservation_app/features/sign_up/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocLisnter extends StatelessWidget {
  const SignupBlocLisnter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () => showLoadingDialog(context),
          signupSuccess: (date) => {
            context.pop(),
            FlutterToast.showFlutterToast(
              message: date,
              state: ToastStates.success,
              context: context,
            ),
            context.pushNamed(Routes.loginScreen),
          },
          signupFailure: (error) => {
            context.pop(),
            FlutterToast.showFlutterToast(
              state: ToastStates.error,
              context: context,
              message: error,
            ),
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showLoadingState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor100,
          ),
        );
      },
    );
  }

  void showErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text(
            apiErrorModel.getAllErrorMessages(),
            style: TextStyles.font12Gray100Medum,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Got it',
                style: TextStyles.font14PrimarySemiBold,
              ),
            )
          ],
        );
      },
    );
  }
}
