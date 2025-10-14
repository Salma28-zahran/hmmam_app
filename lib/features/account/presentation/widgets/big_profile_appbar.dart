import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class BigProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BigProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(320);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.40,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF56C1E1),
            AppColor.primary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -height * 0.075,
            left: -width * 0.20,
            child: Container(
              width: width * 0.55,
              height: width * 0.55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x3390D7EC),
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.05),
                  Text(
                    "profile".tr(),
                    style: AppColor.textwhite.copyWith(fontSize: width * 0.05),
                  ),
                  SizedBox(height: height * 0.025),
                  Text(
                    "create_or_login_message".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.038,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRouteName.signup);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff074F5F),
                      minimumSize: Size(double.infinity, height * 0.055),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                    ),
                    child: Text(
                      "register".tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.042,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.010),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRouteName.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      minimumSize: Size(double.infinity, height * 0.055),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                    ),
                    child: Text(
                      "login".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.042,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
