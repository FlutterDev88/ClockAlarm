import 'package:clock_app/const/enum.dart';
import 'package:clock_app/model/model_alarm.dart';
import 'package:clock_app/model/model_menu.dart';
import 'package:flutter/material.dart';


List<ModelMenu> menuItems = [
  ModelMenu(
    MenuType.clock,
    'Clock',
    Icons.lock_clock,
  ),
  ModelMenu(
    MenuType.alarm,
    'Alarm',
    Icons.alarm,
  ),
];


List<ModelAlarm> alarms = [
  ModelAlarm(
    alarmDateTime: DateTime.now().add(Duration(hours: 1)),
    title: 'Office',
    gradientColorIndex: 0,
  ),
  ModelAlarm(
    alarmDateTime: DateTime.now().add(Duration(hours: 2)),
    title: 'Sport',
    gradientColorIndex: 1,
  ),
];
