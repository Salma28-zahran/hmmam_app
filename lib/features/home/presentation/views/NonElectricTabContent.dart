import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/features/home/presentation/widgets/SelectableTagsRow.dart';
import 'package:hmmam_app/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class Nonelectrictabcontent extends StatelessWidget {
  const Nonelectrictabcontent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 5, start: 15, end: 3),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColor.yellow,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.person_rounded,
                            color: AppColor.white),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Image.asset(AssetsManager.lamp),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColor.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.location_on_sharp,
                            color: AppColor.white),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(AssetsManager.none),
                    ),
                  ),
                ],
              ),

              // 📍 Location
              _directionalTextContainer(
                isArabic,
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColor.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),

                    /// TextField الأول (hint بدل 'location'.tr())
                    SizedBox(
                      width: 90, // ممكن تزوديه أو تقلليه حسب التصميم
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'location'.tr(),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary,
                            fontSize: 13,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary,
                          fontSize: 13,
                        ),
                      ),
                    ),

                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.grey.withOpacity(0.4),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                    ),

                    /// TextField الثاني (hint بدل 'terminal_gate'.tr())
                    SizedBox(
                      width: 110,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'terminal_gate'.tr(),
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),

              ),

              const SizedBox(height: 8),

              // 🗓️ Date + Time
              Row(
                children: [
                  /// العمود الأول (التاريخ)
                  Expanded(
                    child: _directionalTextContainer(
                      isArabic,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: AppColor.primary,
                              size: 18,
                            ),
                            const SizedBox(width: 8),

                            /// TextField الأول (hint بدل 'date'.tr())
                            SizedBox(
                              width: 80,
                              child: TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'date'.tr(),
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                    fontSize: 18,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primary,
                                  fontSize: 18,
                                ),
                              ),
                            ),

                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey.withOpacity(0.4),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 10),
                            ),

                            /// TextField الثاني (hint بدل 'sample_date'.tr())
                            SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'sample_date'.tr(),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// العمود الثاني (الوقت)
                  Expanded(
                    child: _directionalTextContainer(
                      isArabic,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.access_time_outlined,
                              color: AppColor.primary,
                              size: 18,
                            ),
                            const SizedBox(width: 8),

                            /// TextField الأول (hint بدل 'time'.tr())
                            SizedBox(
                              width: 80,
                              child: TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'time'.tr(),
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                    fontSize: 18,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primary,
                                  fontSize: 18,
                                ),
                              ),
                            ),

                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey.withOpacity(0.4),
                              margin:
                              const EdgeInsets.symmetric(horizontal: 10),
                            ),

                            /// TextField الثاني (hint بدل 'sample_time'.tr())
                            SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'sample_time'.tr(),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),



              const SizedBox(height: 8),

              // 🏷️ Tags
              const SelectableTagsRow(),


              const SizedBox(height: 10),

              // 🔘 Power Off button
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.power_settings_new,
                      color: Colors.white, size: 20),
                  label: Text(
                    'power_off'.tr(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 👤 Assistant info card
          Align(
            alignment: isArabic ? Alignment.topLeft : Alignment.topRight,
            child: Container(
              width: 140,
              height: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      color: AppColor.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 26,
                            backgroundImage:
                            AssetImage(AssetsManager.person),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'assistant_name'.tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'assistant_title'.tr(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.lightBlue.shade100.withOpacity(0.7),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'assistance_remind'.tr(),
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: 110,
                              height: 35,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.call,
                                    size: 16, color: Colors.white),
                                label: Text(
                                  'call_now'.tr(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 110,
                              height: 33,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.chat,
                                    size: 16, color: Colors.white),
                                label: Text(
                                  'chat_us'.tr(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _directionalTextContainer(bool isArabic, Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Directionality(
        textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
        child: child,
      ),
    );
  }

}
