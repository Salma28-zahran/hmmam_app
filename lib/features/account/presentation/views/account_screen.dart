import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/features/account/presentation/widgets/big_profile_appbar.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final List<_SettingItem> items = [
    _SettingItem(label: 'change_profile_data', icon: Icons.person_outline),
    _SettingItem(label: 'setting', icon: Icons.settings_outlined),
    _SettingItem(label: 'help_center', icon: Icons.help_outline),
    _SettingItem(label: 'newsletter', icon: Icons.mail_outline),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const BigProfileAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: height * 0.00),
                  itemCount: items.length,
                  separatorBuilder: (context, index) => Column(
                    children: [
                      SizedBox(height: height * 0.005),
                      Divider(
                        height: height * 0.01,
                        thickness: 1,
                        indent: width * 0.04,
                        endIndent: width * 0.04,
                        color: const Color(0xFFEAEAEA),
                      ),
                      SizedBox(height: height * 0.016),
                    ],
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _SettingsTile(
                      label: item.label.tr(),
                      iconData: item.icon,
                      onTap: () {},
                    );
                  },
                ),
                SizedBox(height: height * 0.022),
                const Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: height * 0.012),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingItem {
  final String label;
  final IconData icon;

  const _SettingItem({required this.label, required this.icon});
}

class _SettingsTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback? onTap;

  const _SettingsTile({
    super.key,
    required this.label,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.035,
          vertical: height * 0.007,
        ),
        child: Row(
          children: [
            Center(
              child: Icon(
                iconData,
                size: width * 0.075,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(width: width * 0.035),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: width * 0.042,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.grey,
              size: width * 0.055,
            ),
          ],
        ),
      ),
    );
  }
}
