import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isPasswordVisible = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    String selectedCode = '+20';
    final List<String> countryCodes = ['+20', '+966', '+971', '+1', '+44', '+62'];

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    bool isFormValid =
        phoneController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            isChecked;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "login".tr(),
          style: AppColor.appBar,
        ),
        actions: [
          IconButton(
            icon: Text(
              context.locale.languageCode == 'en' ? 'AR' : 'EN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.04,
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
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("login_to_your_account_travel_app".tr(), style: AppColor.textgrey),
            SizedBox(height: height * 0.04),

            Text("phone".tr(), style: AppColor.textblack),
            SizedBox(height: height * 0.01),

            Row(
              children: [
                Container(
                  width: width * 0.20,
                  height: height * 0.044,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey3),
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCode,
                      icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
                      items: countryCodes
                          .map(
                            (code) => DropdownMenuItem(
                          value: code,
                          child: Text(
                            code,
                            style: const TextStyle(color: AppColor.grey),
                          ),
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
                SizedBox(width: width * 0.015),

                SizedBox(
                  width: width * 0.60,
                  height: height * 0.055,
                  child: TextField(
                    controller: phoneController,
                    onChanged: (_) => setState(() {}),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'enter_your_phone_number'.tr(),
                      hintStyle: const TextStyle(color: Colors.grey),
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
                ),
              ],
            ),

            SizedBox(height: height * 0.04),

            Text("password".tr(), style: AppColor.textblack),
            SizedBox(height: height * 0.01),

            SizedBox(
              width: width * 0.95,
              height: height * 0.055,
              child: TextField(
                controller: passwordController,
                onChanged: (_) => setState(() {}),
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "enter_your_password".tr(),
                  hintStyle: AppColor.textgrey,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
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
            ),

            SizedBox(height: height * 0.01),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.025,
                      width: height * 0.025,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: Colors.grey),
                        visualDensity: VisualDensity.compact,
                        activeColor: AppColor.primary,
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Text("remember_me".tr(), style: AppColor.textgrey),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.forget);
                  },
                  child: Text(
                    "forgot_password?".tr(),
                    style: AppColor.textprimary.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.03),

            Center(
              child: SizedBox(
                width: width * 0.9,
                height: height * 0.059,
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
                    Navigator.pushNamed(context, PageRouteName.main);
                  }
                      : null,
                  child: Text(
                    "login".tr(),
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
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
