import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetsManager.email,
                  width: width * 0.45,
                  height: height * 0.22,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: height * 0.025),

                Text(
                  "Check your Email",
                  style: AppColor.textblack.copyWith(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: height * 0.008),

                Text(
                  "We have sent a password recover to your email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: height * 0.025),

                SizedBox(
                  width: width * 0.9,
                  height: height * 0.053,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, PageRouteName.reset);
                    },
                    child: Text(
                      "Open Email",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: height * 0.05,
                left: width * 0.03,
                right: width * 0.03,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: width * 0.035,
                  ),
                  children: [
                    TextSpan(
                      text:
                      "Not receiving email? Try checking email spam or\n ",
                      style: TextStyle(
                        fontSize: width * 0.034,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "try another email",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, PageRouteName.forget);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
