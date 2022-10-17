import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width * 0.5000000, 0),
        Offset(size.width * 0.5000000, size.height), [
      Color(0xff0B3399).withOpacity(1),
      Color(0xff0B3399).withOpacity(0.58),
      Color(0xff0B3399).withOpacity(0.44),
      Color(0xff0B3399).withOpacity(1)
    ], [
      0,
      0.431014,
      0.553842,
      1
    ]);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
