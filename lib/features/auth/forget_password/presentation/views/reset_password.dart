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
    bool isFormValid =
        newpasswordController.text.isNotEmpty &&
            confirmpasswordController.text.isNotEmpty &&
            newpasswordController.text == confirmpasswordController.text;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: AppColor.appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your new password must be different from\nprevious used passwords.",
              style: AppColor.textgrey,
            ),
            const SizedBox(height: 15),

            // New password
            Text("New Password", style: AppColor.textblack),
            const SizedBox(height: 4),
            TextField(
              controller: newpasswordController,
              onChanged: (_) => setState(() {
                passwordsMatch = newpasswordController.text ==
                    confirmpasswordController.text;
              }),
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: AppColor.textgrey,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Password must be at least 8 characters long!",
              style: AppColor.textgrey.copyWith(fontSize: 12),
            ),

            const SizedBox(height: 15),

            // Confirm password
            Text("Confirm New Password", style: AppColor.textblack),
            const SizedBox(height: 4),
            TextField(
              controller: confirmpasswordController,
              onChanged: (_) => setState(() {
                passwordsMatch = newpasswordController.text ==
                    confirmpasswordController.text;
              }),
              obscureText: !isPasswordVisible2,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: AppColor.textgrey,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible2
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible2 = !isPasswordVisible2;
                    });
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 2),

            if (!passwordsMatch)
              const Text(
                "The password you entered is not the same as the above!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              Text(
                "Both passwords must match",
                style: AppColor.textgrey.copyWith(fontSize: 12),
              ),

            const SizedBox(height: 15),

            // Create new password button
            SizedBox(
              width: double.infinity,
              height: 47,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFormValid
                      ? AppColor.primary
                      : Colors.grey.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: isFormValid
                    ? () {
                  Navigator.pushNamed(context, PageRouteName.login);
                }
                    : null,
                child: const Text(
                  "Create New Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const Spacer(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                    children: [
                      const TextSpan(
                        text:
                        "Not receiving email? Try checking email spam or\n",
                      ),
                      TextSpan(
                        text: "try another email",
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
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
