import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

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
                decoration:  BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        icon: const Icon(Icons.more_vert, color: AppColor.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: h * 0.15,
                left: 20,
                right: 20,
                child: Container(
                  height: h * 0.70,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                ),
              ),

            ],
          ),
          SizedBox(height: h * 0.37,),
          SizedBox(
            width: w*0.92,
            height: h * 0.065,
            child:
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    PageRouteName.ticket);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Go to home", style: TextStyle(fontSize: w * 0.045, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
