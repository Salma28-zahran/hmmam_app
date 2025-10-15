import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/features/home/presentation/widgets/WheelchairTypeWidget.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),

            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: context.locale.languageCode == 'ar'
                          ? 'تم الاختيار  '
                          : 'Selected  ',
                      style: AppColor.textblack.copyWith(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    TextSpan(
                      text: context.locale.languageCode == 'ar'
                          ? 'كرسي متحرك'
                          : 'wheelchair',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const WheelchairTypeWidget(),
          ],
        ),
      ),
    );
  }
}
