import 'package:doctor_reservation_app/core/helpers/extension.dart';
import 'package:doctor_reservation_app/core/routing/routes.dart';
import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DonotHaveAnAccount extends StatelessWidget {
  const DonotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\t have an account ',
            style: TextStyles.font13Gray100Medium,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13PrimarySemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signupScreen);
              },
          ),
        ],
      ),
    );
  }
}
