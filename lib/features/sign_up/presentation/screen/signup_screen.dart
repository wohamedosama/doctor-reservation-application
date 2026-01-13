import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/core/widgets/custom_text_button.dart';
import 'package:doctor_reservation_app/features/login/presentation/widgets/terms_and_conditions.dart';
import 'package:doctor_reservation_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doctor_reservation_app/features/sign_up/presentation/widget/already_have_an_account.dart';
import 'package:doctor_reservation_app/features/sign_up/presentation/widget/form_fields_for_register_screen.dart';
import 'package:doctor_reservation_app/features/sign_up/presentation/widget/signup_bloc_lisnter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
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
                Text('Create Account', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14Gray70Regular,
                ),
                verticalSpace(18),
                Column(
                  children: [
                    const FormFieldsForRegisterScreen(),
                    verticalSpace(32),
                    CustomTextButton(
                        onPressed: () {
                          validateThensignup(context);
                        },
                        text: 'Create an account'),
                    verticalSpace(24),
                    const TermsAndConditions(),
                    verticalSpace(40),
                    const AlreadyHaveAccountText(),
                    const SignupBlocLisnter(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThensignup(BuildContext context) {
    final formKey = context.read<SignupCubit>().formKey;
    context.read<SignupCubit>().emitSignupState();

    // if (formKey.currentState?.validate() ?? false) {
    // }
  }
}
