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
    bool isFormValid = emailController.text.isNotEmpty ;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: AppColor.appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,top: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter the email associated with your account and we'll send you an email with instructions for\n"
                " resetting your password",style: AppColor.textgrey,
            textAlign: TextAlign.left,),
            SizedBox(height: 20,),
            Text("Email", style: AppColor.textblack),
            const SizedBox(height: 6),
            SizedBox(
              width: 328,
              height: 40,
              child: TextField(
                controller: emailController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "vixturistic.studio@example.com",
                  hintStyle: AppColor.textgrey,
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
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 360,
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
                  Navigator.pushNamed(context, PageRouteName.check);
                }
                    : null,
                child: const Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
