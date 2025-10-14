import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ====== Language Switch Button ======
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, // 16
                vertical: height * 0.012,  // 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Text(
                      context.locale.languageCode == 'en' ? 'AR' : 'EN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04, // 16
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
            ),

            // ====== PageView ======
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                children: [
                  _buildPage(
                    context: context,
                    image: AssetsManager.onboard1,
                    title: "find_your_destination".tr(),
                    description: "onboarding".tr(),
                    pageIndex: 0,
                  ),
                  _buildPage(
                    context: context,
                    image: AssetsManager.onboard2,
                    title: "booking_your_seat".tr(),
                    description: "onboarding".tr(),
                    pageIndex: 1,
                  ),
                  _buildPage(
                    context: context,
                    image: AssetsManager.onboard3,
                    title: "enjoy_your_trip".tr(),
                    description: "onboarding".tr(),
                    pageIndex: 2,
                  ),
                ],
              ),
            ),

            // ====== Button ======
            Padding(
              padding: EdgeInsets.only(
                bottom: height * 0.05, // 40
                top: height * 0.03,    // 24
              ),
              child: SizedBox(
                width: width * 0.95, // 380
                height: height * 0.06, // 50
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage < 2) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        PageRouteName.signup,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.03), // 12
                    ),
                  ),
                  child: Text(
                    "buttononboarding".tr(),
                    style: TextStyle(
                      fontSize: width * 0.045, // 18
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  // ====== Page Builder ======
  Widget _buildPage({
    required BuildContext context,
    required String image,
    required String title,
    required String description,
    required int pageIndex,
  }) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08), // 30
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ====== Image ======
            Container(
              width: width * 0.9,  // 360
              height: height * 0.42, // 360
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03), // 12
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(image),
              ),
            ),

            SizedBox(height: height * 0.015), // 12
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppColor.textblack.copyWith(fontSize: width * 0.05), // 20
            ),
            SizedBox(height: height * 0.015), // 12

            // ====== Description ======
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.038, // 15
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            SizedBox(height: height * 0.025), // 20

            // ====== Page Indicator ======
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.01), // 4
                  width: width * 0.025, // 10
                  height: width * 0.025, // 10
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColor.primary
                        : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
