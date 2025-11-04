import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class WheelchairDetail extends StatelessWidget {
  final String cityName;
  final String airport;
  final String terminalGate;
  final String date;
  final String time;
  final String passengerName;
  final String wheelchairType;
  final String seatType;
  final String totalPrice;

  const WheelchairDetail({
    super.key,
    required this.cityName,
    required this.airport,
    required this.terminalGate,
    required this.date,
    required this.time,
    required this.passengerName,
    required this.wheelchairType,
    required this.seatType,
    required this.totalPrice,
  });
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: h * 0.16, // ≈130
                width: w,
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
              ),

              Positioned.fill(
                child: CustomPaint(painter: CirclePatternPainter()),
              ),

              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Wheelchair Detail",
                          style: AppColor.textblack.copyWith(fontSize: w * 0.045),
                        ),
                      ),
                    ),
                    SizedBox(width: w * 0.12),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Monday, 10 May 2023",
                      style: TextStyle(
                        fontSize: w * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: w * 0.04, color: Colors.black54),
                        SizedBox(width: w * 0.015),
                        Text(
                          "08:00 am",
                          style: TextStyle(fontSize: w * 0.035, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h * 0.005),
                Text(
                  "1 Passenger",
                  style: TextStyle(fontSize: w * 0.035, color: Colors.black54),
                ),
                SizedBox(height: h * 0.01),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: w * 0.05, right: w * 0.025),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("08:00",
                        style: TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.w700)),
                    SizedBox(height: h * 0.005),
                    Text("10 May", style: TextStyle(fontSize: w * 0.035, color: Colors.black54)),
                  ],
                ),

                SizedBox(width: w * 0.03),

                Column(
                  children: [
                    Container(
                      width: w * 0.03,
                      height: w * 0.03,
                      decoration: const BoxDecoration(
                        color: Color(0xff2DBBDA),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(width: w * 0.005, height: h * 0.25, color: const Color(0xff2DBBDA)),
                    Container(
                      width: w * 0.03,
                      height: w * 0.03,
                      decoration: const BoxDecoration(
                        color: Color(0xff2DBBDA),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: w * 0.03),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$cityName",
                        style: TextStyle(fontSize: w * 0.045, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Terminal 3 - Gate A",
                        style: TextStyle(fontSize: w * 0.035, color: Colors.black54),
                      ),
                      SizedBox(height: h * 0.015),

                      Container(
                        padding: EdgeInsets.all(w * 0.03),
                        decoration: BoxDecoration(
                          color: Color(0xffEAF8FC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AssetsManager.none, height: h * 0.08),
                                SizedBox(width: w * 0.02),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Ahmed",
                                        style: TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.w700)),
                                    Text(
                                      "Mobility Assistance",
                                      style: TextStyle(fontSize: w * 0.032, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: h * 0.01),
                            Divider(color: Colors.black54, thickness: 0.3),
                            SizedBox(height: h * 0.01),

                            Row(
                              children: [
                                Icon(Icons.shield_outlined, size: w * 0.045, color: Colors.black54),
                                SizedBox(width: w * 0.015),
                                Text("Fordable", style: TextStyle(fontSize: w * 0.035)),
                              ],
                            ),

                            SizedBox(height: h * 0.01),

                            Row(
                              children: [
                                Icon(Icons.add_box_outlined, size: w * 0.045, color: Colors.black54),
                                SizedBox(width: w * 0.015),
                                Text("wide seat", style: TextStyle(fontSize: w * 0.035)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02,),
            child: Container(
              width: w,
              padding: EdgeInsets.all(w * 0.03),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price", style: AppColor.textblack),
                      Text(
                        "Rp920.000",
                        style: TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.w600, color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  SizedBox(
                    width: w,
                    height: h * 0.065,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text("Submit", style: TextStyle(fontSize: w * 0.045, fontWeight: FontWeight.w600)),
                    ),
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

class CirclePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(.07);
    canvas.drawCircle(const Offset(60, 20), 80, paint);
    canvas.drawCircle(const Offset(200, 100), 90, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
