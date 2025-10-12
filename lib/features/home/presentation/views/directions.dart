import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';

class Directions extends StatelessWidget {
  const Directions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [



          Positioned.fill(
            child: Image.asset(
              AssetsManager.street,
              fit: BoxFit.cover,
            ),
          ),


          /// الطريق الأزرق + الأسهم فوقه
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                   AssetsManager.blue,// دي الصورة الزرقا
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.contain,
                  ),

                  /// الأسهم على الطريق الأزرق
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                            size: 60,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// زر الرجوع
          Positioned(
            top: 60,
            left: 20,
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, PageRouteName.main);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22,
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),

          /// الكارد اللي تحت
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        "wheelchair_navigation".tr(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.green,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Karang Tengah",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// الكرسي والزر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetsManager.electric,
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                "wheelchair_X-214".tr(),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "5_meters_away".tr(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 38,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC85C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Center(
                          child: Text(
                            "direction".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// البطارية والمدى
                  Row(
                    children:  [
                      Icon(Icons.energy_savings_leaf_rounded,
                          color: Colors.green, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "battery".tr(),
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Text(
                        "80%".tr(),
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 22),
                      Icon(Icons.energy_savings_leaf,
                          color: Colors.blueAccent, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "range".tr(),
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Text(
                        "50_km".tr(),
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
