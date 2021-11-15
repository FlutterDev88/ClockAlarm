
import 'dart:math';

import 'package:clock_app/const/style.dart';
import 'package:flutter/widgets.dart';

class PainterClock extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var paintFill = Paint()
      ..color = Style.colorClockBg;

    var paintOutline = Paint()
      ..color = Style.colorClockOutline
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    var paintCenterDot = Paint()..color = Style.colorClockOutline;

    var paintSec = Paint()
      ..color = Style.colorSec
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var paintMin = Paint()
      ..color = Style.colorMin
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var paintHour = Paint()
      ..color = Style.colorHour
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    canvas.drawCircle(center, radius * 0.75, paintFill);
    canvas.drawCircle(center, radius * 0.75, paintOutline);

    var hourX = centerX + radius * 0.4 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourY = centerY + radius * 0.4 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourX, hourY), paintHour);

    var minX = centerX + radius * 0.6 * cos(dateTime.minute * 6 * pi / 180);
    var minY = centerY + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minX, minY), paintMin);

    var secX = centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    var secY = centerY + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secX, secY), paintSec);

    canvas.drawCircle(center, radius * 0.12, paintCenterDot);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
