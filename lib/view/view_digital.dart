import 'dart:async';

import 'package:clock_app/const/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ViewDigital extends StatefulWidget {
  const ViewDigital({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewDigitalState();
}


class _ViewDigitalState extends State<ViewDigital> {

  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  Timer? timer;


  @override
  void initState() {
    super.initState();
    this.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var perviousMinute = DateTime.now().add(Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute)
        setState(() {
          formattedTime = DateFormat('HH:mm').format(DateTime.now());
        });
    });
  }


  @override
  void dispose() {
    super.dispose();
    this.timer!.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Text(
      formattedTime,
      style: TextStyle(
        color: Style.colorPrimaryText,
        fontSize: 64,
      ),
    );
  }
}
