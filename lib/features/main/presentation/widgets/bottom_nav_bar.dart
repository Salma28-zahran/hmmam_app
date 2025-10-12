import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.white,
      selectedItemColor:AppColor.primary ,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      elevation: 10,
      items:  [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.homeLg),
          label: context.locale.languageCode == 'ar'
              ? 'الرئيسية'
              : 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: context.locale.languageCode == 'ar'
              ? 'الطلبات'
              : 'Orders',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmarks_rounded),
          label: context.locale.languageCode == 'ar'
              ? 'المحفوظات'
              : 'Saved',

        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: context.locale.languageCode == 'ar'
              ? 'الحساب'
              : 'Account',

        ),
      ],
    );
  }
}
