import 'package:clock_app/const/style.dart';
import 'package:clock_app/view/view_digital.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class WidgetDigital extends StatefulWidget {
  @override
  _WidgetDigitalState createState() => _WidgetDigitalState();
}


class _WidgetDigitalState extends State<WidgetDigital> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ViewDigital(),
          Text(
            formattedDate,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Style.colorPrimaryText,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
