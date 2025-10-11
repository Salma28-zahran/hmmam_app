import 'package:flutter/material.dart';
import 'package:hmmam_app/features/account/presentation/widgets/big_profile_appbar.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  final List<_SettingItem> items = const [
    _SettingItem(label: 'Change Profile Data', icon: Icons.person_outline),
    _SettingItem(label: 'Setting', icon: Icons.settings_outlined),
    _SettingItem(label: 'Help & Center', icon: Icons.help_outline),
    _SettingItem(label: 'Newstletter', icon: Icons.mail_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: BigProfileAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: items.length,
                    separatorBuilder: (context, index) => Column(
                      children: const [
                        SizedBox(height: 7),
                        Divider(
                          height: 24,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                          color: Color(0xFFEAEAEA),
                        ),
                        SizedBox(height: 13),
                      ],
                    ),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return _SettingsTile(
                        label: item.label,
                        iconData: item.icon,
                        onTap: () {},
                      );
                    },
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 10),
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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Row(
          children: [
            Center(
              child: Icon(iconData, size: 28, color: Colors.grey.shade700),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.grey,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
