import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/features/home/presentation/views/directions.dart';
import 'package:hmmam_app/theme/app_theme.dart';



class NearbyWheelchairScreen extends StatelessWidget {
  const NearbyWheelchairScreen({Key? key}) : super(key: key);

  static const Color background = Color(0xFFF5F6F8);
  static const Color primaryBlue = Color(0xFF54C0F0); // rent button
  static const Color darkText = Color(0xFF101133);
  static const Color accentGreen = Color(0xFF35C06C);
  static const double horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // Top map area (approx 48% of screen)
            _MapHeader(),

            // The sheet container starts here
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // drag indicator
                      Center(
                        child: Container(
                          width: 60,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Search row
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F8FA),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Row(
                                children:  [
                                  Icon(Icons.location_on_outlined, color: Colors.grey),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'set_your_location'.tr(),
                                      style: TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF7F8FA),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: const Icon(Icons.filter_list, color: Colors.grey),
                          )
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Title and location
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  'nearby_wheelchair'.tr(),
                                  style: TextStyle(
                                    color: darkText,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.location_on, color: accentGreen, size: 16),
                              SizedBox(width: 6),
                              Text(
                                'Karang Tengah',
                                style: TextStyle(color: Colors.grey, fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),

                      const SizedBox(height: 12),

                      // List
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(top: 6, bottom: 12),
                          itemCount: 3,
                          separatorBuilder: (context, index) => const Divider(height: 24),
                          itemBuilder: (context, index) {
                           return _WheelchairListItem(onRent: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const Directions()),
                              );
                            });

                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MapHeader extends StatelessWidget {
  const _MapHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.45;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // map placeholder
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFEFF3F6),
            child: CustomPaint(
              painter: _MapLinesPainter(),
            ),
          ),

          // back button (circle)
          Positioned(
            left: 18,
            top: 18,
            child: Material(
              color: Colors.white,
              elevation: 4,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => Navigator.maybePop(context),
                child: const SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(Icons.arrow_back, color: Color(0xFF2E2C49)),
                ),
              ),
            ),
          ),

          // blue translucent circle to mimic radius
          Positioned(
            left: 36,
            top: height * 0.12,
            child: Container(
              width: height * 0.6,
              height: height * 0.6,
              decoration: BoxDecoration(
                color: const Color(0xBB9FDDF0),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // some marker dots (decorative)
          Positioned(
            left: 60,
            top: height * 0.06,
            child: _MarkerDot(),
          ),

          Positioned(
            right: 36,
            top: height * 0.1,
            child: _MarkerDot(big: true),
          ),

          Positioned(
            right: 38,
            bottom: 54,
            child: _MarkerDot(),
          ),

          // center blue marker
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 12,
            top: height / 2 - 16,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFF34A6FF),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.blue.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 4)),
                ],
              ),
              child: const Icon(Icons.place, color: Colors.white, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarkerDot extends StatelessWidget {
  final bool big;
  const _MarkerDot({this.big = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = big ? 42 : 34;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8)],
      ),
      child: Center(
        child: Container(
          width: size * 0.62,
          height: size * 0.62,
          decoration: BoxDecoration(
            color: const Color(0xFF9FE8FF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: size * 0.34,
              height: size * 0.34,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue.shade200, width: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WheelchairListItem extends StatelessWidget {
  final VoidCallback onRent;
  const _WheelchairListItem({required this.onRent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        children: [
          // wheelchair image
          SizedBox(
            width: 82,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(6),
                child: Image.asset(AssetsManager.electric, fit: BoxFit.contain),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'wheelchair_X-214'.tr(),
                  style: AppColor.textblack
                ),
                const SizedBox(height: 6),
                Text('5_meters_away'.tr(), style: TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 10),

                // battery & range row
                Row(
                  children: [
                    // battery
                    Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.energy_savings_leaf_outlined, color: Colors.green, size: 18),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('battery'.tr(), style: TextStyle(fontSize: 10, color: Colors.grey)),
                            Text('80%'.tr(), style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(width: 18),

                    // range
                    Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.speed, color: Colors.blue, size: 18),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('range'.tr(), style: TextStyle(fontSize: 10, color: Colors.grey)),
                            Text('50_km'.tr(), style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          // Rent button
          GestureDetector(
            onTap: onRent,
            child: Container(
              width: 65,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.blue.withOpacity(0.12), blurRadius: 8, offset: const Offset(0, 4)),
                ],
              ),
              child:  Center(
                child: Text('rent'.tr(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MapLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFE2E6EA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    // simple decorative lines / polygons to mimic map roads
    final Path p = Path();
    p.moveTo(size.width * 0.08, size.height * 0.28);
    p.lineTo(size.width * 0.42, size.height * 0.18);
    p.lineTo(size.width * 0.68, size.height * 0.26);
    p.lineTo(size.width * 0.92, size.height * 0.12);

    canvas.drawPath(p, paint);

    final Paint thin = Paint()
      ..color = const Color(0xFFF2F5F7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Path p2 = Path();
    p2.moveTo(size.width * 0.12, size.height * 0.6);
    p2.lineTo(size.width * 0.5, size.height * 0.5);
    p2.lineTo(size.width * 0.78, size.height * 0.7);

    canvas.drawPath(p2, thin);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
