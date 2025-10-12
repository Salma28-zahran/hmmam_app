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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ====== Language Switch Button ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Text(
                      context.locale.languageCode == 'en' ? 'AR' : 'EN',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
                    image: AssetsManager.onboard1,
                    title: "find_your_destination".tr(),
                    description: "onboarding".tr(),
                    pageIndex: 0,
                  ),
                  _buildPage(
                    image: AssetsManager.onboard2,
                    title: "booking_your_seat".tr(),
                    description: "onboarding".tr(),
                    pageIndex: 1,
                  ),
                  _buildPage(
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
              padding: const EdgeInsets.only(bottom: 40.0, top: 24.0),
              child: SizedBox(
                width: 380,
                height: 50,
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "buttononboarding".tr(),
                    style: const TextStyle(
                      fontSize: 18,
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
    required String image,
    required String title,
    required String description,
    required int pageIndex,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ====== Image ======
            Container(
              width: 360,
              height: 360,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(image),
              ),
            ),

            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppColor.textblack.copyWith(fontSize: 20)
            ),
            const SizedBox(height: 12),


            // ====== Description ======
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            // ====== Page Indicator ======
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
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
