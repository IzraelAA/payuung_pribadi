import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utils/app_color.dart';

class SemiCircleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Lebar border

    final Path path = Path();

    path.moveTo(0, 36);
    path.lineTo(size.width / 2 - 36, 36);

    path.arcToPoint(
      Offset(size.width / 2 + 36, 36),
      radius: const Radius.circular(40),
      clockwise: true,
    );
    path.lineTo(size.width, 36);

    path.lineTo(size.width, size.height - 36);
    path.lineTo(0, size.height - 36);
    path.lineTo(0, 36);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
