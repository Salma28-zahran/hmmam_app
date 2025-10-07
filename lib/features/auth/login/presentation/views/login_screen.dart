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
    bool isFormValid =
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isChecked;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: AppColor.appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,top: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login to your account Travel App",style: AppColor.textgrey,),
            SizedBox(height: 30,),
            Text("Phone Number", style: AppColor.textblack),
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
                const SizedBox(width: 6),
                SizedBox(
                  width: 240,
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

              ],
            ),
            SizedBox(height: 30,),
            Text("Password", style: AppColor.textblack),
            const SizedBox(height: 4),
            SizedBox(
              width: 370,
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
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
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
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Remember me",
                      style: AppColor.textgrey,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.forget);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppColor.textprimary.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            Center(
              child: SizedBox(
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
                    Navigator.pushNamed(context, PageRouteName.main);
                  }
                      : null,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
