import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/features/home/presentation/views/wheelchair_detail.dart';
import 'package:hmmam_app/features/home/presentation/widgets/wheelchair_detail_args.dart'; // علشان WheelchairDetailArgs

class WheelchairDetailBottomSheet extends StatelessWidget {
  final WheelchairDetailArgs args;

  const WheelchairDetailBottomSheet({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(w * 0.05),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(height: h * 0.02),

            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black54),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 17),
                const Text(
                  "Your Order",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            SizedBox(height: h * 0.01),

            Padding(
              padding: EdgeInsets.only(left: w * 0.02, right: w * 0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.time,
                        style: TextStyle(
                          fontSize: w * 0.04,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Text(
                        args.date.replaceAll(" ", "\n"),
                        style: TextStyle(
                          fontSize: w * 0.035,
                          color: Colors.black54,
                          height: 1.2,
                        ),
                      ),

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
                      Container(
                        width: w * 0.005,
                        height: h * 0.25,
                        color: const Color(0xff2DBBDA),
                      ),
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
                          args.cityName,
                          style: TextStyle(
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          args.terminalGate,
                          style: TextStyle(
                            fontSize: w * 0.035,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: h * 0.015),

                        Container(
                          padding: EdgeInsets.all(w * 0.03),
                          decoration: BoxDecoration(
                            color: const Color(0xffEAF8FC),
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
                                      Text(
                                        args.passengerName,
                                        style: TextStyle(
                                          fontSize: w * 0.04,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "Mobility Assistance",
                                        style: TextStyle(
                                          fontSize: w * 0.032,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: h * 0.01),
                              const Divider(color: Colors.black54, thickness: 0.3),
                              SizedBox(height: h * 0.01),

                              Row(
                                children: [
                                  const Icon(Icons.shield_outlined,
                                      size: 20, color: Colors.black54),
                                  const SizedBox(width: 6),
                                  Text(args.wheelchairType,
                                      style: TextStyle(fontSize: w * 0.035)),
                                ],
                              ),
                              SizedBox(height: h * 0.01),

                              Row(
                                children: [
                                  const Icon(Icons.add_box_outlined,
                                      size: 20, color: Colors.black54),
                                  const SizedBox(width: 6),
                                  Text(args.seatType,
                                      style: TextStyle(fontSize: w * 0.035)),
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
          ],
        ),
      ),
    );
  }
}
