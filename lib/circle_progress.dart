import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {

  final strokeCircle = 10.0;
  late double currentProgress;


  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    // I will draw circle
    Paint circle = Paint()
        ..strokeWidth = strokeCircle
        ..color = Colors.grey
        ..style = PaintingStyle.stroke;
    // center of device
    Offset center = Offset(size.width/2, size.height/2);
    double radius = 120;
    canvas.drawCircle(center, radius, circle);

    // I will draw animation
    Paint animationArc = Paint()
    ..strokeWidth = strokeCircle
    ..color = Colors.purpleAccent
    ..style = PaintingStyle.stroke;

    double angle = 2 * pi * (currentProgress/100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        pi/2, angle, false, animationArc);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}