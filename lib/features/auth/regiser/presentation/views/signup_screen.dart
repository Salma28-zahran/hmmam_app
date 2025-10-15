import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.04,
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
          left: screenWidth * 0.05,
          top: screenHeight * 0.025,
          right: screenWidth * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "to_get_started_please_fill_out_the_registration_form_below".tr(),
                style: AppColor.textgrey.copyWith(
                  fontSize: screenWidth * 0.037,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text("name".tr(),
                  style: AppColor.textblack.copyWith(
                    fontSize: screenWidth * 0.042,
                  )),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.055,
                child: TextField(
                  controller: nameController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "e.g_vixturistic".tr(),
                    hintStyle: AppColor.textgrey.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
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
              SizedBox(height: screenHeight * 0.025),
              Text("phone".tr(),
                  style: AppColor.textblack.copyWith(
                    fontSize: screenWidth * 0.042,
                  )),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.23,
                    height: screenHeight * 0.047,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCode,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: AppColor.grey),
                        items: countryCodes.map((code) {
                          final englishCode = code;
                          final displayCode =
                          context.locale.languageCode == 'ar'
                              ? _convertToArabicNumbers(code)
                              : code;

                          return DropdownMenuItem(
                            value: englishCode,
                            child: Text(displayCode,
                                style: const TextStyle(color: AppColor.grey)),
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
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: SizedBox(
                      height: screenHeight * 0.055,
                      child: TextField(
                        controller: phoneController,
                        onChanged: (_) => setState(() {}),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'enter_your_phone_number'.tr(),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.025),
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
              SizedBox(height: screenHeight * 0.015),
              Text("password".tr(),
                  style: AppColor.textblack.copyWith(
                    fontSize: screenWidth * 0.042,
                  )),
              SizedBox(height: screenHeight * 0.005),
              SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.055,
                child: TextField(
                  controller: passwordController,
                  onChanged: (_) => setState(() {}),
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "enter_your_password".tr(),
                    hintStyle: AppColor.textgrey.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: screenWidth * 0.05,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
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
              SizedBox(height: screenHeight * 0.005),
              Text(
                "password_must_be_at_least_8_characters_long!".tr(),
                style: AppColor.textgrey.copyWith(
                  fontSize: screenWidth * 0.032,
                ),
              ),
              SizedBox(height: screenHeight * 0.035),

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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text:
                        "by_clicking_\"register,\"_you_agree_to_our".tr(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: screenWidth * 0.035,
                        ),
                        children: [
                          TextSpan(
                            text: 'terms_and_conditions'.tr(),
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                          TextSpan(text: 'and'.tr()),
                          TextSpan(
                            text: 'privacy_policy'.tr(),
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.050,
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
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),
              Divider(thickness: 0.4, color: AppColor.grey),
              SizedBox(height: screenHeight * 0.015),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetsManager.facebook,
                        width: screenWidth * 0.08),
                    SizedBox(width: screenWidth * 0.03),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Column(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.google,
                                    size: 30,
                                  ),
                                  SizedBox(height: screenHeight * 0.008),
                                  Text('choose_an_account'.tr()),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('to_continue_to_travel_app'.tr()),
                                  SizedBox(height: screenHeight * 0.02),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/user1.png'),
                                    ),
                                    title: const Text('Vixturistic'),
                                    subtitle:
                                    const Text('info.studio@gmail.com'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/user1.png'),
                                    ),
                                    title: const Text('Vixturistic'),
                                    subtitle:
                                    const Text('info.studio@gmail.com'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const Divider(),
                                  ListTile(
                                    leading: const Icon(Icons.add),
                                    title: Text('add_another_account'.tr()),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const Divider(),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: AppColor.textgrey.copyWith(
                                          fontSize: screenWidth * 0.032),
                                      children: [
                                        TextSpan(
                                          text: 'google_share_message'.tr(),
                                        ),
                                        TextSpan(
                                          text: 'privacy_policy'.tr(),
                                          style: const TextStyle(
                                            color: AppColor.primary,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                        ),
                                        TextSpan(
                                          text: 'and'.tr(),
                                        ),
                                        TextSpan(
                                          text: 'terms_of_service'.tr(),
                                          style: const TextStyle(
                                            color: AppColor.primary,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        AssetsManager.google,
                        height: screenHeight * 0.06,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Image.asset(AssetsManager.apple,
                        width: screenWidth * 0.08),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.15),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'have_you_an_account?'.tr(),
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: screenWidth * 0.038),
                    children: [
                      TextSpan(
                        text: 'login'.tr(),
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.038,
                        ),
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
