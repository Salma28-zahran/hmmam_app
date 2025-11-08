import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/resources/app_assets_manager.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/features/home/presentation/widgets/wheelchair_detail_args.dart';
import 'package:hmmam_app/features/payment/presentation/widgets/PromoVoucherWidget.dart';
import 'package:hmmam_app/features/payment/presentation/widgets/WheelchairDetailPopup.dart';
import 'package:hmmam_app/features/payment/presentation/widgets/booking_steps_indicator.dart';
import 'package:hmmam_app/theme/app_theme.dart';

class PaymentScreen extends StatefulWidget {
  final WheelchairDetailArgs args;

  const PaymentScreen({super.key, required this.args});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  static const int _startTime = 600;
  late int _remainingSeconds;
  Timer? _timer;
  int currentStep = 2;


  // ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  // المتغير اللي هيخزن وسيلة الدفع المختارة
  String? selectedMethod;
  String? selectedImage;
  // ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

  @override
  void initState() {
    super.initState();
    _remainingSeconds = _startTime;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "00 : $minutes : $seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _navigateAndSelectMethod(BuildContext context) async {
    final result = await Navigator.pushNamed(context, PageRouteName.method);
    if (result is Map<String, String>) {
      setState(() {
        selectedMethod = result['title'];
        selectedImage = result['asset'];
        setState(() {
          currentStep = 3; // مثلاً لما يختار طريقة الدفع
        });
// ✅ ننتقل للخطوة الثالثة بعد اختيار طريقة الدفع
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
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
                          style: AppColor.textblack.copyWith(
                            fontSize: w * 0.045,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: w * 0.12),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Center(child: BookingStepsIndicator(currentStep: currentStep)),

          ),
          const SizedBox(height: 15),
          /////container 1///////
          Container(
            width: 380,
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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Complete payment in", style: AppColor.textblack),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: AppColor.primary2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _formatTime(_remainingSeconds),
                          style: const TextStyle(
                            color: Color(0xFF168AAD),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsManager.none,
                            height: 50,
                          ),
                          const SizedBox(width: 6),
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
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22)),
                            ),
                            builder: (context) {
                              return WheelchairDetailBottomSheet(
                                  args: widget.args);
                            },
                          );
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          //////container 2//////
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 120,
              width: 380,
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
              child: selectedMethod == null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Payment Method",
                          style: AppColor.textblack,
                        )),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => _navigateAndSelectMethod(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        "Select Payment Method",
                        style: TextStyle(
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Method",
                          style: AppColor.textblack.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () => _navigateAndSelectMethod(context),
                          child: const Text(
                            "Change",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 40,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            selectedImage ?? '',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          selectedMethod ?? '',
                          style: AppColor.textblack.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          ///////container 3//////
         const PromoVoucherWidget(),
        ],
      ),
    );
  }
}
