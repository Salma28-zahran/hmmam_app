import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    bool isFormValid = emailController.text.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: AppColor.appBar,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          top: height * 0.012,
          right: width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter the email associated with your account and we'll send you an email with instructions for\nresetting your password",
              style: AppColor.textgrey,
              textAlign: TextAlign.left,
            ),

            SizedBox(height: height * 0.03),

            Text("Email", style: AppColor.textblack),

            SizedBox(height: height * 0.008),

            SizedBox(
              width: width * 0.9,
              height: height * 0.055,
              child: TextField(
                controller: emailController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "vixturistic.studio@example.com",
                  hintStyle: AppColor.textgrey,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: width * 0.03),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.03),

            SizedBox(
              width: width * 0.9,
              height: height * 0.055,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  isFormValid ? AppColor.primary : Colors.grey.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                ),
                onPressed: isFormValid
                    ? () {
                  Navigator.pushNamed(context, PageRouteName.check);
                }
                    : null,
                child: Text(
                  "Reset Password",
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
    );
  }
}
