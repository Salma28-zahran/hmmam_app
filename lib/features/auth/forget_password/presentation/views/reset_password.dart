import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool passwordsMatch = true;
  bool isPasswordVisible2 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    bool isFormValid =
        newpasswordController.text.isNotEmpty &&
            confirmpasswordController.text.isNotEmpty &&
            newpasswordController.text == confirmpasswordController.text;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: AppColor.appBar.copyWith(fontSize: width * 0.05),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.012,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your new password must be different from\nprevious used passwords.",
              style: AppColor.textgrey.copyWith(fontSize: width * 0.035),
            ),
            SizedBox(height: height * 0.02),

            /// New password
            Text(
              "New Password",
              style: AppColor.textblack.copyWith(fontSize: width * 0.04),
            ),
            SizedBox(height: height * 0.005),
            TextField(
              controller: newpasswordController,
              onChanged: (_) => setState(() {
                passwordsMatch = newpasswordController.text ==
                    confirmpasswordController.text;
              }),
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: AppColor.textgrey.copyWith(fontSize: width * 0.035),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                    size: width * 0.055,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.025),
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
            SizedBox(height: height * 0.005),
            Text(
              "Password must be at least 8 characters long!",
              style: AppColor.textgrey.copyWith(fontSize: width * 0.03),
            ),
            SizedBox(height: height * 0.02),

            /// Confirm password
            Text(
              "Confirm New Password",
              style: AppColor.textblack.copyWith(fontSize: width * 0.04),
            ),
            SizedBox(height: height * 0.005),
            TextField(
              controller: confirmpasswordController,
              onChanged: (_) => setState(() {
                passwordsMatch = newpasswordController.text ==
                    confirmpasswordController.text;
              }),
              obscureText: !isPasswordVisible2,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: AppColor.textgrey.copyWith(fontSize: width * 0.035),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible2
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                    size: width * 0.055,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible2 = !isPasswordVisible2;
                    });
                  },
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.025),
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
            SizedBox(height: height * 0.005),

            if (!passwordsMatch)
              Text(
                "The password you entered is not the same as the above!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              Text(
                "Both passwords must match",
                style: AppColor.textgrey.copyWith(fontSize: width * 0.03),
              ),

            SizedBox(height: height * 0.02),

            /// Create new password button
            SizedBox(
              width: double.infinity,
              height: height * 0.055,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFormValid
                      ? AppColor.primary
                      : Colors.grey.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                ),
                onPressed: isFormValid
                    ? () {
                  Navigator.pushNamed(context, PageRouteName.login);
                }
                    : null,
                child: Text(
                  "Create New Password",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const Spacer(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: width * 0.035,
                    ),
                    children: [
                      const TextSpan(
                        text:
                        "Not receiving email? Try checking email spam or\n",
                      ),
                      TextSpan(
                        text: "try another email",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: width * 0.035,
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
      ),
    );
  }
}
