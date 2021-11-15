// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../view/widget_alarm.dart' as _i4;
import '../view/widget_clock.dart' as _i2;
import '../view/widget_digital.dart' as _i3;
import '../view/widget_main.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    RouterMain.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.WidgetMain());
    },
    RouterClock.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.WidgetClock());
    },
    RouterDigital.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.WidgetDigital());
    },
    RouterAlarm.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.WidgetAlarm());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(RouterMain.name, path: '/', children: [
          _i5.RouteConfig(RouterClock.name,
              path: 'clock', parent: RouterMain.name),
          _i5.RouteConfig(RouterDigital.name,
              path: 'digital', parent: RouterMain.name),
          _i5.RouteConfig(RouterAlarm.name,
              path: 'alarm', parent: RouterMain.name)
        ])
      ];
}

/// generated route for [_i1.WidgetMain]
class RouterMain extends _i5.PageRouteInfo<void> {
  const RouterMain({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'RouterMain';
}

/// generated route for [_i2.WidgetClock]
class RouterClock extends _i5.PageRouteInfo<void> {
  const RouterClock() : super(name, path: 'clock');

  static const String name = 'RouterClock';
}

/// generated route for [_i3.WidgetDigital]
class RouterDigital extends _i5.PageRouteInfo<void> {
  const RouterDigital() : super(name, path: 'digital');

  static const String name = 'RouterDigital';
}

/// generated route for [_i4.WidgetAlarm]
class RouterAlarm extends _i5.PageRouteInfo<void> {
  const RouterAlarm() : super(name, path: 'alarm');

  static const String name = 'RouterAlarm';
}
