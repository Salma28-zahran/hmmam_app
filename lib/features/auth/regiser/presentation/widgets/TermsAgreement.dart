import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class TermsAgreement extends StatefulWidget {
  const TermsAgreement({super.key});

  @override
  State<TermsAgreement> createState() => _TermsAgreementState();
}

class _TermsAgreementState extends State<TermsAgreement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(color: AppColor.grey),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'By clicking ',
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 14,
                height: 1.4,
              ),
              children: [
                const TextSpan(
                  text: '"Register", you agree to our ',
                  style: TextStyle(  color: AppColor.black),
                ),
                TextSpan(
                  text: 'terms and conditions',
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                    },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'privacy policy.',
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
