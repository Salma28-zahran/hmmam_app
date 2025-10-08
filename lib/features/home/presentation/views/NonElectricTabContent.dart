import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class Nonelectrictabcontent extends StatelessWidget {
  const Nonelectrictabcontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15, right: 3),
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
                        child: Icon(Icons.person_rounded, color: AppColor.white),
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
                        child:
                        Icon(Icons.location_on_sharp, color: AppColor.white),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(-45, -7),
                      child: Image.asset(AssetsManager.none),
                    ),
                  ),
                ],
              ),
      Container(
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
        child:
        Row(
          children: [
            Icon(Icons.location_on_outlined, color: AppColor.primary, size: 20),
            const SizedBox(width: 8),
            const Text(
              'Location',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.primary,
                fontSize: 13,
              ),
            ),

            Container(
              height: 20,
              width: 1,
              color: Colors.grey.withOpacity(0.4),
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),

            const Text(
              'Terminal 3 - Gate A',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ],
        ),

      ),

      const SizedBox(height: 8),

      // 🗓️ Date + Time
      Row(
        children: [
          Expanded(
            child: Container(
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
              child:Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      color: AppColor.primary, size: 18),
                  const SizedBox(width: 8),
                  const Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                      fontSize: 13,
                    ),
                  ),

                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey.withOpacity(0.4),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),

                  const Text(
                    'Aug 8, 2022',
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),

            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
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
              child:
              Row(
                children: [
                  // ⏰ Time label
                  Row(
                    children: [
                      Icon(Icons.access_time_outlined,
                          color: AppColor.primary, size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        'Time',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey.withOpacity(0.4),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),

                  const Text(
                    '08:00 am',
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),

            ),
          ),
        ],
      ),

      const SizedBox(height: 8),

      // 🏷️ Tags
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTag('Self-push', Colors.white, Colors.black87),
          _buildTag('Fordable', AppColor.primary, Colors.black),
          _buildTag('wide seat', AppColor.primary, Colors.black),
        ],
      ),

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
          label: const Text(
            'Power Off',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
      ],







          ),
          Positioned(
            right: 1,
            top: 1,
            child:Container(
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
                      width: 160,
                      color: AppColor.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 26,
                            backgroundImage: AssetImage(AssetsManager.person),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Ahmed',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Mobility Assistance',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        width: 140,
                        height: 210,
                        color: Colors.lightBlue.shade100.withOpacity(0.7),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 27),
                              child: Text(
                                'Assistance\nremind in 3 minutes',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  height: 1.4,

                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            /// زر Call Now
                            SizedBox(
                              width: 110,
                              height: 35,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.call, size: 16, color: Colors.white),
                                label: const Text(
                                  'Call Now',
                                  style: TextStyle(fontSize: 12, color: Colors.white),
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
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.chat, size: 16, color: Colors.white),
                                label: const Text(
                                  'Chat Us',
                                  style: TextStyle(fontSize: 12, color: Colors.white),
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
            )
          ),
        ],
      ),

    );
  }
Widget _buildTag(String text, Color bg, Color textColor) {
  return
    Container(
      width: 120,
    height: 40,
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.black12.withOpacity(0.1)),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
}
