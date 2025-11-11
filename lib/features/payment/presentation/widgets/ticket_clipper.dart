import 'dart:ui';
import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final radius = 15.0; // انحناءات الأطراف
    final cutRadius = 15.0; // نصف قطر الفتحة
    final firstCutOffset = -60.0; // الفتحة الأولى (الأعلى)
    final secondCutOffset = 165.0; // الفتحة الثانية (تحتها بشوية)

    Path path = Path()
    // ▪️ الزاوية العليا اليسرى
      ..moveTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)

    // ▪️ أول فتحة يمين (العلوية)
      ..lineTo(size.width, size.height / 2 + firstCutOffset - cutRadius)
      ..arcToPoint(
        Offset(size.width, size.height / 2 + firstCutOffset + cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )

    // ▪️ ثاني فتحة يمين (السفلية)
      ..lineTo(size.width, size.height / 2 + secondCutOffset - cutRadius)
      ..arcToPoint(
        Offset(size.width, size.height / 2 + secondCutOffset + cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )

    // ▪️ نزول للأسفل
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(size.width, size.height, size.width - radius, size.height)
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)

    // ▪️ ثاني فتحة شمال (السفلية)
      ..lineTo(0, size.height / 2 + secondCutOffset + cutRadius)
      ..arcToPoint(
        Offset(0, size.height / 2 + secondCutOffset - cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )

    // ▪️ أول فتحة شمال (العلوية)
      ..lineTo(0, size.height / 2 + firstCutOffset + cutRadius)
      ..arcToPoint(
        Offset(0, size.height / 2 + firstCutOffset - cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )

      ..lineTo(0, radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) => false;
}
