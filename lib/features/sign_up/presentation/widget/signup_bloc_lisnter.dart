import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/helpers/flutter_toast.dart';
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
          loading: () => showLoadingDialog(context),
          success: (date) => {
            context.pop(),
            FlutterToast.showFlutterToast(
              message: 'Signup Successfully',
              state: ToastStates.success,
              context: context,
            ),
            context.pushNamed(Routes.loginScreen),
          },
          failure: (error) => {
            context.pop(),
            FlutterToast.showFlutterToast(
              message: error,
              state: ToastStates.error,
              context: context,
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

  void showErrorState(BuildContext context, String error) {
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
            error,
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
