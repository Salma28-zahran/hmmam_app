import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class OnGoing extends StatelessWidget {
  const OnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.025), // 20
        Center(
          child: Image.asset(
            AssetsManager.welcoming,
            width: width * 0.8,
          ),
        ),
        SizedBox(height: height * 0.021), // 17
        Center(
          child: Text(
            "access_your_booking_with_ease".tr(),
            textAlign: TextAlign.center,
            style: AppColor.textblack.copyWith(
              fontSize: width * 0.05, // 20
            ),
          ),
        ),
        SizedBox(height: height * 0.011), // 9
        Center(
          child: Text(
            "login_register_to_see_bookings".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.04, // 16
            ),
          ),
        ),
        SizedBox(height: height * 0.03), // 25

        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1), // 40
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ====== Login Button ======
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageRouteName.login);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColor.grey3, width: width * 0.004), // 1.5
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.02), // 8
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.014), // 14
                  ),
                  child: Text(
                    "login".tr(),
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: width * 0.04, // 16
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(width: width * 0.04), // 16

              // ====== Register Button ======
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageRouteName.signup);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.02), // 8
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.014), // 14
                  ),
                  child: Text(
                    "register".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04, // 16
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
