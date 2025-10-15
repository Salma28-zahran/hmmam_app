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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

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
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "we_have_sent_code".tr(),
                style: AppColor.textgrey,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: height * 0.04),

              // PIN input fields
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                keyboardType: TextInputType.number,
                textStyle: TextStyle(fontSize: width * 0.05, color: AppColor.black),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(width * 0.03),
                  fieldHeight: height * 0.07,
                  fieldWidth: width * 0.12,
                  inactiveColor: AppColor.grey,
                  activeColor: AppColor.primary,
                  selectedColor: AppColor.primary.withOpacity(0.7),
                  borderWidth: 1.2,

                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
                ),
                cursorColor: AppColor.primary,
                animationType: AnimationType.fade,
                animationDuration: const Duration(milliseconds: 200),
                mainAxisAlignment: MainAxisAlignment.center,
                beforeTextPaste: (text) => true,
                pastedTextStyle: const TextStyle(color: AppColor.primary),
                onChanged: (value) {
                  setState(() {
                    isButtonActive = value.length == 4;
                  });
                },
              ),



              SizedBox(height: height * 0.02),

              // Timer
              Text(
                "00:${secondsRemaining.toString().padLeft(2, '0')}",
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: height * 0.015),

              // Resend text
              RichText(
                text: TextSpan(
                  text: "didn't_receive_the_code?".tr(),
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: width * 0.04,
                  ),
                  children: [
                    TextSpan(
                      text: " ${"resend.".tr()}",
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.05),

              // Verify button
              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: ElevatedButton(
                  onPressed: isButtonActive
                      ? () {
                    Navigator.pushNamed(context, PageRouteName.login);
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isButtonActive ? AppColor.primary : AppColor.grey,
                    foregroundColor: AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.02),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "verify".tr(),
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
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
