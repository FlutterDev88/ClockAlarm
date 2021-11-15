import 'package:auto_route/auto_route.dart';
import 'package:clock_app/const/style.dart';
import 'package:clock_app/route/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WidgetMain extends StatefulWidget {

  @override
  _WidgetMainState createState() => _WidgetMainState();
}


class _WidgetMainState extends State<WidgetMain> {

  BottomNavigationBarItem _buildBottomItem(
    IconData icon,
    String text,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: isSelected
        ? Icon(icon, color: Style.colorPrimary)
        : Icon(icon, color: Colors.grey),
      label: text,
    );
  }


  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        RouterClock(),
        RouterDigital(),
        RouterAlarm(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          activeColor: Style.colorPrimary,
          items: <BottomNavigationBarItem>[
            _buildBottomItem(Icons.lock_clock, 'CLOCK', tabsRouter.activeIndex == 0),
            _buildBottomItem(Icons.watch, 'DIGITAL', tabsRouter.activeIndex == 1),
            _buildBottomItem(Icons.alarm, 'ALARM', tabsRouter.activeIndex == 2),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );

  }

}
