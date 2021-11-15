import 'package:clock_app/view/view_clock.dart';
import 'package:flutter/material.dart';


class WidgetClock extends StatefulWidget {
  @override
  _WidgetClockState createState() => _WidgetClockState();
}


class _WidgetClockState extends State<WidgetClock> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ViewClock(
            size: MediaQuery.of(context).size.height / 4,
          ),
        ],
      ),
    );
  }

}
