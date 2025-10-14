import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/features/main/presentation/views/main_screen.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "notifications".tr(),
          style: AppColor.appBar.copyWith(fontSize: width * 0.05),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: width * 0.06,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.22),
          Center(
            child: Image.asset(
              AssetsManager.notifications_image,
              width: width * 0.6,
            ),
          ),
          SizedBox(height: height * 0.025),
          Text(
            "no_notifications_yet".tr(),
            style: AppColor.textblack.copyWith(
              fontSize: width * 0.05,
            ),
          ),
          SizedBox(height: height * 0.012),
          Center(
            child: Text(
              "all_notifications_text".tr(),
              style: AppColor.textgrey.copyWith(
                fontSize: width * 0.04,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
