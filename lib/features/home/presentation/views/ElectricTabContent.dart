import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class Electrictabcontent extends StatelessWidget {
  final double batteryLevel;

  const Electrictabcontent({super.key, required this.batteryLevel});

  @override
  Widget build(BuildContext context) {
    double filledHeight = (batteryLevel / 100) * 200;

    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15,right: 3),
      child: Column(
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
                    child: Image.asset(AssetsManager.power),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(Icons.bluetooth, color: AppColor.white,),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColor.grey3,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(Icons.lock, color: AppColor.grey2,),
                  ),
                ],
              ),
              SizedBox(width: 30,),
              Expanded(
                child: Transform.translate(
                  offset: const Offset(0, -30),
                  child: Image.asset(AssetsManager.electric),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xffC3E7F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 12,
                      height: filledHeight,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${batteryLevel.toInt()}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Battery%",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),

            ],
          ),
          Row(
            children: [
              Container(
                width: 144,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(
                    color: AppColor.grey3,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Range",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "100",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C1C2E),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "km",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(width: 20,),
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    border:Border.all(
                        color: AppColor.grey3
                    ),borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 33),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.power_settings_new_outlined,color: AppColor.primary,),
                      ),

                    ),
                    SizedBox(width: 10,),
                    Text("Power Off",style:AppColor.textwhite,)
                  ],
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(AssetsManager.cart,),

                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Register Now!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C1C2E),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Create or login an account and get more benefits",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      )

    );
  }
}
