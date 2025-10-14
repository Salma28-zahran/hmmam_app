import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ClipPath(
      clipper: SideCurveClipper(),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primary,
        elevation: 0,
        toolbarHeight: height * 0.14,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: width * 0.055,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.cyan,
                    size: width * 0.075,
                  ),
                ),
                SizedBox(width: width * 0.04),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size(width * 0.26, height * 0.04),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.005,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.02),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, PageRouteName.login);
                  },
                  child: Text(
                    'login'.tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.038,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(width: width * 0.025),
                IconButton(
                  icon: Text(
                    context.locale.languageCode == 'en' ? 'AR' : 'EN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.042,
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.notifications);
                  },
                  child: Image.asset(
                    AssetsManager.notification,
                    width: width * 0.075,
                    height: height * 0.045,
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.03),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width * 0.035),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.search,
                            color: Colors.grey, size: width * 0.045),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.042,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: 'search_for_wheelchair_for_you'.tr(),
                              hintStyle: TextStyle(
                                color: AppColor.grey,
                                fontSize: width * 0.038,
                              ),
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: width * 0.02),
                Container(
                  height: height * 0.055,
                  width: height * 0.055,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.035),
                  ),
                  child: Icon(
                    FontAwesomeIcons.list,
                    color: AppColor.grey,
                    size: width * 0.045,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}

class SideCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 10);

    path.quadraticBezierTo(
      size.width * 0.05,
      size.height + 10,
      size.width * 0.15,
      size.height,
    );

    path.lineTo(size.width * 0.85, size.height);

    path.quadraticBezierTo(
      size.width * 0.95,
      size.height + 10,
      size.width,
      size.height - 10,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
