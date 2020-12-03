import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final Paint paint = Paint()
      ..color = Colors.grey[100]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    canvas.drawCircle(center, 100, paint);

    final Paint completed = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15;

    canvas.drawArc(Rect.fromCircle(center: center, radius: 100), -pi / 2,
        pi * 2 * 0.8, false, completed);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
