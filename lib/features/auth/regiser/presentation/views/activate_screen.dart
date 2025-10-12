import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({super.key});

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {
  TextEditingController otpController = TextEditingController();
  bool isButtonActive = false;
  int secondsRemaining = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "verify_phone".tr(),
          style: AppColor.appBar,
        ),
        actions: [
          IconButton(
            icon: Text(
              context.locale.languageCode == 'en' ? 'AR' : 'EN',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "we_have_sent_code".tr(),
                style: AppColor.textgrey,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // PIN input fields
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                keyboardType: TextInputType.number,
                textStyle: const TextStyle(fontSize: 20, color: AppColor.black),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 55,
                  fieldWidth: 55,
                  inactiveColor: AppColor.grey,
                  activeColor: AppColor.primary,
                  selectedColor: AppColor.grey,
                ),
                onChanged: (value) {
                  setState(() {
                    isButtonActive = value.length == 4;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Timer
              Text(
                "00:${secondsRemaining.toString().padLeft(2, '0')}",
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              // Resend text
              RichText(
                text: TextSpan(
                  text: "didn't_receive_the_code?".tr(),
                  style: const TextStyle(color: AppColor.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: " ${"resend.".tr()}",
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Verify button
              ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                  Navigator.pushNamed(context, PageRouteName.login);
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor:
                  isButtonActive ? AppColor.primary : AppColor.grey,
                  foregroundColor: AppColor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "verify".tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
