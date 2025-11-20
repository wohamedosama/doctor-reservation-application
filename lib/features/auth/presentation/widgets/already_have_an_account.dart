import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account yet? ',
            style: TextStyles.font13Gray100Medium,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13PrimarySemiBold,
          ),
        ],
      ),
    );
  }
}
