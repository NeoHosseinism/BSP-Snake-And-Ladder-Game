import 'package:flutter/material.dart';

class PlayerTokenPainter extends CustomPainter {
  final double x, y;
  final Color color;

  PlayerTokenPainter({
    required this.x,
    required this.y,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // // set the paint color to be white
    // paint.color = Colors.white;

    // // Create a rectangle with size and width same as the canvas
    // var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // // draw the rectangle using the paint
    // canvas.drawRect(rect, paint);

    // paint.color = Colors.yellow;

    // // create a path
    // var path = Path();
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, 0);
    // // close the path to form a bounded shape
    // path.close();

    // canvas.drawPath(path, paint);

    // set the color property of the paint
    paint.color = color;

    // center of the canvas is (x,y) => (width/2, height/2)
    final Offset center = Offset(x, y);

    // draw the circle with center having radius 15
    canvas.drawCircle(center, 15, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}