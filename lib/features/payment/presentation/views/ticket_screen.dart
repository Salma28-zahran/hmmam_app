import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

import '../../../home/presentation/widgets/wheelchair_detail_args.dart';

class TicketScreen extends StatefulWidget {
  final WheelchairDetailArgs args;

  const TicketScreen({super.key, required this.args});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: h * 0.50,
                width: w,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 48),
                      Text(
                        "Your Ticket",
                        style: AppColor.textblack.copyWith(
                          fontSize: w * 0.056,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: AppColor.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: h * 0.11,
                left: 20,
                right: 20,
                child: Container(
                  height: h * 0.75,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          right: 20,
                          left: 20,
                          bottom: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Image.asset(AssetsManager.ticket)],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.args.cityName,
                                  style: TextStyle(
                                    fontSize: w * 0.045,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  widget.args.terminalGate,
                                  style: TextStyle(
                                    fontSize: w * 0.035,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 3, // ارتفاع الخط
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final boxWidth = 6.0;
                              final dashWidth = 4.0;
                              final dashCount =
                                  (constraints.maxWidth /
                                          (boxWidth + dashWidth))
                                      .floor();

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(dashCount, (_) {
                                  return Container(
                                    width: boxWidth,
                                    height: 1,
                                    color: AppColor.black,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AssetsManager.none, height: 73),
                            SizedBox(width: 6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ahmed",
                                  style: TextStyle(
                                    fontSize: w * 0.045,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Mobility Assistance",
                                  style: TextStyle(
                                    fontSize: w * 0.035,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 2,
                        indent: w * 0.054,
                        endIndent: w * 0.20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 25),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(AssetsManager.fordable),
                                SizedBox(width: w * 0.025),
                                Text(
                                  "Fordable",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: w * 0.037,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: h * 0.015),
                            Row(
                              children: [
                                Image.asset(AssetsManager.video),
                                SizedBox(width: w * 0.025),
                                Text(
                                  "Wide Seat",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: w * 0.037,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.04),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 3, // ارتفاع الخط
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final boxWidth = 6.0;
                              final dashWidth = 4.0;
                              final dashCount =
                                  (constraints.maxWidth /
                                          (boxWidth + dashWidth))
                                      .floor();

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(dashCount, (_) {
                                  return Container(
                                    width: boxWidth,
                                    height: 1,
                                    color: AppColor.black,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.02,),
                      Column(children: [
                        Image.asset(AssetsManager.qrcode),
                        Text("Scan Here" ,
                          style: TextStyle(
                            fontSize: w * 0.040,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: h * 0.39),
          SizedBox(
            width: w * 0.92,
            height: h * 0.065,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageRouteName.main);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Go to home",
                style: TextStyle(
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
