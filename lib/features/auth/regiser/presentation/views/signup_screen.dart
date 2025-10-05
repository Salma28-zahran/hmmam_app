import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/features/auth/regiser/presentation/widgets/TermsAgreement.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedCode = '+62';
  final List<String> countryCodes = ['+20', '+966', '+971', '+1', '+44', '+62'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    bool isFormValid = nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isChecked;

    return Scaffold(
      appBar: AppBar(title: Text("Register", style: AppColor.appBar)),
      body: Padding(
        padding: const EdgeInsets.only(left: 19, top: 20, right: 19),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "To get started, please fill out the registration form below",
                style: AppColor.textgrey,
              ),
              const SizedBox(height: 40),
              Text("Name", style: AppColor.textblack),
              const SizedBox(height: 8),
              SizedBox(
                width: 328,
                height: 40,
                child: TextField(
                  controller: nameController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "e.g. Vixturistic",
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
              const SizedBox(height: 20),
              Text("Phone", style: AppColor.textblack),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCode,
                        icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
                        items: countryCodes
                            .map(
                              (code) => DropdownMenuItem(
                            value: code,
                            child: Text(code, style: const TextStyle(color: AppColor.grey)),
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCode = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: phoneController,
                        onChanged: (_) => setState(() {}),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          hintStyle: const TextStyle(color: Colors.grey),
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
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text("Password", style: AppColor.textblack),
              const SizedBox(height: 4),
              SizedBox(
                width: 328,
                height: 40,
                child: TextField(
                  controller: passwordController,
                  onChanged: (_) => setState(() {}),
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
              ),
              const SizedBox(height: 2),
              Text(
                "Password must be at least 8 characters long!",
                style: AppColor.textgrey.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 27),

              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'By clicking "Register," you agree to our ',
                        style: const TextStyle(color: Colors.black87, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'terms and conditions',
                            style: const TextStyle(color: Colors.lightBlue),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'privacy policy.',
                            style: const TextStyle(color: Colors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Center(
                child: SizedBox(
                  width: 328,
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
                      Navigator.pushNamed(context, PageRouteName.active);
                    }
                        : null,
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),
              Divider(thickness: 0.4, color: AppColor.grey),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetsManager.facebook),
                    const SizedBox(width: 10),
                    Image.asset(AssetsManager.google),
                    const SizedBox(width: 10),
                    Image.asset(AssetsManager.apple),
                  ],
                ),
              ),
              const SizedBox(height: 110),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have you an account? ',
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
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
