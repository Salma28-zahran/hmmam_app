import 'package:flutter/material.dart';
import 'package:hmmam_app/features/home/presentation/widgets/WheelchairTypeWidget.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selected ',
                      style: AppColor.textblack.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    TextSpan(
                      text: 'Wheelchair',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 18,
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
