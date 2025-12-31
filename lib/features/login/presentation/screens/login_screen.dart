import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/core/widgets/custom_text_button.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation_app/features/login/presentation/widgets/build_bloc_listner.dart';
import 'package:doctor_reservation_app/features/login/presentation/widgets/donot_have_an_account.dart';
import 'package:doctor_reservation_app/features/login/presentation/widgets/email_and_password.dart';
import 'package:doctor_reservation_app/features/login/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14Gray70Regular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        'Forget Password?',
                        style: TextStyles.font14PrimaryRegular,
                      ),
                    ),
                    verticalSpace(32),
                    CustomTextButton(
                        onPressed: () {
                          validateThenLogin(context);
                        },
                        text: 'Login'),
                    verticalSpace(24),
                    const TermsAndConditions(),
                    verticalSpace(40),
                    const DonotHaveAnAccount(),
                    const BuildBlocListner(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    final formKey = context.read<LoginCubit>().formKey;
    if (formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
