import 'dart:async';
import 'dart:math';

import 'package:clock_app/view/painter_clock.dart';
import 'package:flutter/material.dart';


class ViewClock extends StatefulWidget {
  final double? size;

  const ViewClock({Key? key, this.size}) : super(key: key);

  @override
  _ViewClockState createState() => _ViewClockState();
}


class _ViewClockState extends State<ViewClock> {
  Timer? timer;

  @override
  void initState() {
    this.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    this.timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: PainterClock(),
          ),
        ),
      ),
    );
  }
}
