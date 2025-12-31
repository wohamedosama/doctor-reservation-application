import 'package:doctor_reservation_app/core/helpers/app_regex.dart';
import 'package:doctor_reservation_app/core/helpers/spacing.dart';
import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:doctor_reservation_app/core/widgets/custom_text_form_field.dart';
import 'package:doctor_reservation_app/features/login/presentation/widgets/password_validation.dart';
import 'package:doctor_reservation_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormFieldsForRegisterScreen extends StatefulWidget {
  const FormFieldsForRegisterScreen({super.key});

  @override
  State<FormFieldsForRegisterScreen> createState() =>
      _FormFieldsForRegisterScreenState();
}

class _FormFieldsForRegisterScreenState
    extends State<FormFieldsForRegisterScreen> {
  bool isObscurePassword = true;
  bool isObscureConfirmationPassword = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinimumLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacter =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinimumLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Name',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Phone Number',
            validator: (String value) {
              if (value.isEmpty || !AppRegex.isPhoneNumber(value)) {
                return 'Please enter your phone Number';
              }
              return null;
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Email',
            validator: (String value) {
              if (value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter your name';
              }
              return null;
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Password',
            isObscureText: true,
            controller: context.read<SignupCubit>().passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
              child: Icon(
                color: AppColor.primaryColor100,
                size: 24,
                isObscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(16),
          CustomTextFormField(
            isObscureText: isObscureConfirmationPassword,
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Confirm Password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureConfirmationPassword =
                      !isObscureConfirmationPassword;
                });
              },
              child: Icon(
                color: AppColor.primaryColor100,
                size: 24,
                isObscureConfirmationPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasMinimumLength: hasMinimumLength,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasUpperCase: hasUpperCase,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
