import 'dart:ui';
import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final radius = 15.0;
    final cutRadius = 15.0;
    final firstCutOffset = -60.0;
    final secondCutOffset = 165.0;

    Path path = Path()
      ..moveTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)

      ..lineTo(size.width, size.height / 2 + firstCutOffset - cutRadius)
      ..arcToPoint(
        Offset(size.width, size.height / 2 + firstCutOffset + cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )

      ..lineTo(size.width, size.height / 2 + secondCutOffset - cutRadius)
      ..arcToPoint(
        Offset(size.width, size.height / 2 + secondCutOffset + cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )

      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(size.width, size.height, size.width - radius, size.height)
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)

      ..lineTo(0, size.height / 2 + secondCutOffset + cutRadius)
      ..arcToPoint(
        Offset(0, size.height / 2 + secondCutOffset - cutRadius),
        radius: Radius.circular(cutRadius),
        clockwise: false,
      )

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
