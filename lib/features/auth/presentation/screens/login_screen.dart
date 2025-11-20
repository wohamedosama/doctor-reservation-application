import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:doctor_reservation_app/core/widgets/custom_text_button.dart';
import 'package:doctor_reservation_app/core/widgets/custom_text_form_field.dart';
import 'package:doctor_reservation_app/features/auth/presentation/widgets/already_have_an_account.dart';
import 'package:doctor_reservation_app/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final formKey = GlobalKey<FormState>();
bool isObscureText = false;

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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const CustomTextFormField(hintText: 'Email'),
                      verticalSpace(16),
                      CustomTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            color: AppColor.primaryColor100,
                            size: 24,
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(16),
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Text(
                          'Forget Password?',
                          style: TextStyles.font14PrimaryRegular,
                        ),
                      ),
                      verticalSpace(32),
                      CustomTextButton(onPressed: () {}, text: 'Login'),
                      verticalSpace(24),
                      const TermsAndConditions(),
                      verticalSpace(40),
                      const AlreadyHaveAnAccount()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
