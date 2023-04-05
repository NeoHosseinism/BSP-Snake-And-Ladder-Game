import 'dart:math';

import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double arrowSize;
  double startX;
  double startY;
  double endX;
  double endY;

  ArrowPainter({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
    required this.arrowSize,
    this.color = Colors.black,
    this.strokeWidth = 2.5,
  }) {
    startX += 22;
    startY += 22;
    endX += 22;
    endY += 22;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(startX, startY);
    path.lineTo(endX, endY);

    // Draw arrowhead
    double angle = atan2(endY - startY, endX - startX);
    double arrowX1 = endX - arrowSize * cos(angle - pi / 6);
    double arrowY1 = endY - arrowSize * sin(angle - pi / 6);
    double arrowX2 = endX - arrowSize * cos(angle + pi / 6);
    double arrowY2 = endY - arrowSize * sin(angle + pi / 6);
    path.moveTo(endX, endY);
    path.lineTo(arrowX1, arrowY1);
    path.moveTo(endX, endY);
    path.lineTo(arrowX2, arrowY2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) {
    return false;
  }
}