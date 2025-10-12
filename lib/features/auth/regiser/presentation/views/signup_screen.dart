import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedCode = '+20';
  final List<String> countryCodes = ['+20', '+966', '+971', '+1', '+44', '+62'];

  String _convertToArabicNumbers(String input) {
    const english = ['0','1','2','3','4','5','6','7','8','9'];
    const arabic = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }
    return input;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isChecked;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "register".tr(),
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
        padding: const EdgeInsets.only(left: 19, top: 20, right: 19),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "to_get_started_please_fill_out_the_registration_form_below".tr(),
                style: AppColor.textgrey,
              ),
              const SizedBox(height: 40),
              Text("name".tr(), style: AppColor.textblack),
              const SizedBox(height: 8),
              SizedBox(
                width: 328,
                height: 40,
                child: TextField(
                  controller: nameController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "e.g_vixturistic".tr(),
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
              Text("phone".tr(), style: AppColor.textblack),
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
                        items: countryCodes.map((code) {
                          final englishCode = code;
                          final displayCode = context.locale.languageCode == 'ar'
                              ? _convertToArabicNumbers(code)
                              : code;

                          return DropdownMenuItem(
                            value: englishCode,
                            child: Text(displayCode, style: const TextStyle(color: AppColor.grey)),
                          );
                        }).toList(),
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
                          hintText: 'enter_your_phone_number'.tr(),
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
              Text("password".tr(), style: AppColor.textblack),
              const SizedBox(height: 4),
              SizedBox(
                width: 328,
                height: 40,
                child: TextField(
                  controller: passwordController,
                  onChanged: (_) => setState(() {}),
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "enter_your_password".tr(),
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
                "password_must_be_at_least_8_characters_long!".tr(),
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
                    activeColor: AppColor.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "by_clicking_\"register,\"_you_agree_to_our".tr(),
                        style: const TextStyle(color: Colors.black87, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'terms_and_conditions'.tr(),
                            style: const TextStyle(color: AppColor.primary),
                          ),
                          TextSpan(text: 'and'.tr()),
                          TextSpan(
                            text: 'privacy_policy'.tr(),
                            style: const TextStyle(color: AppColor.primary),
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
                    child: Text(
                      "register".tr(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                    text: 'have_you_an_account?'.tr(),
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'login'.tr(),
                        style: const TextStyle(color: AppColor.primary, fontWeight: FontWeight.w600),
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
