import 'package:doctor_reservation_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font13Gray60Regular,
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyles.font13Gray100Medium,
          ),
          TextSpan(
            text: 'and ',
            style: TextStyles.font13Gray60Regular,
          ),
          TextSpan(
            text: 'PrivacyPolicy.',
            style: TextStyles.font13Gray100Medium,
          ),
        ],
      ),
    );
  }
}
