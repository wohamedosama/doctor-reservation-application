import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/helpers/flutter_toast.dart';
import 'package:doctor_reservation_app/core/routing/routes.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/core/widgets/custom_loading_indicator.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBlocListner extends StatelessWidget {
  const BuildBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showLoadingDialog(context),
          success: (loginResponse) {
            context.pop();
            FlutterToast.showFlutterToast(
              message: 'Login Sucessfully',
              state: ToastStates.success,
              context: context,
            );
            context.pushNamed(Routes.homeScreen);
          },
          failure: (error) {
            context.pop();
            FlutterToast.showFlutterToast(
                message: error.toString(),
                state: ToastStates.error,
                context: context);

            //showErrorState(context, error);
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
