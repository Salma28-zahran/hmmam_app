import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class OnGoing extends StatelessWidget {
  const OnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        const SizedBox(height: 20),
        Center(child: Image.asset(AssetsManager.welcoming)),
        const SizedBox(height: 17),
        Center(
          child: Text(
            "access_your_booking_with_ease".tr(),
            textAlign: TextAlign.center,
            style: AppColor.textblack.copyWith(fontSize: 20),
          ),
        ),
        const SizedBox(height: 9),
        Center(
          child: Text(
            "login_register_to_see_bookings".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageRouteName.login);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColor.grey3, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "login".tr(),
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageRouteName.signup);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child:  Text(
                    "register".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
