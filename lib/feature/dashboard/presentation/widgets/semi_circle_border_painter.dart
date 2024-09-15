import 'package:flutter/material.dart';

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 36); // Mulai dari kiri pada tinggi 36
    path.lineTo(size.width / 2 + 36, 36);
    path.arcToPoint(
      Offset(size.width / 2 - 36, 36),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    path.lineTo(size.width, 36);
    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.lineTo(0, -36);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
