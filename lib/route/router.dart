import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clock_app/view/widget_alarm.dart';
import 'package:clock_app/view/widget_clock.dart';
import 'package:clock_app/view/widget_digital.dart';
import 'package:clock_app/view/widget_main.dart';

import 'app_route.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: AppRoute.PATH_MAIN,
      name: AppRoute.ROUTER_MAIN,
      page: WidgetMain,
      children: [
        AutoRoute(
          path: AppRoute.PATH_CLOCK,
          name: AppRoute.ROUTER_CLOCK,
          page: WidgetClock,
        ),
        AutoRoute(
          path: AppRoute.PATH_DIGITAL,
          name: AppRoute.ROUTER_DIGITAL,
          page: WidgetDigital,
        ),
        AutoRoute(
          path: AppRoute.PATH_ALARM,
          name: AppRoute.ROUTER_ALARM,
          page: WidgetAlarm,
        ),
      ],
    ),
  ],
)

class $AppRouter {}
