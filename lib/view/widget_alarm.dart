import 'package:clock_app/repo_alarm.dart';
import 'package:clock_app/const/style.dart';
import 'package:clock_app/model/model_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import '../main.dart';


class WidgetAlarm extends StatefulWidget {
  @override
  _WidgetAlarmState createState() => _WidgetAlarmState();
}


class _WidgetAlarmState extends State<WidgetAlarm> {

  DateTime _timeAlarm = DateTime.now();
  String _textAlarm = '';
  RepoAlarm _repoAlarm = RepoAlarm();
  Future<List<ModelAlarm>>? _alarms;
  List<ModelAlarm> _currentAlarms = [];


  void _loadAlarms() {
    _alarms = _repoAlarm.getAlarms();
    if (mounted) setState(() {});
  }


  void _scheduleAlarm(
    DateTime scheduledNotificationDateTime,
    ModelAlarm alarmInfo
  ) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Office',
      alarmInfo.title,
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      payload: 'Payload',
      androidAllowWhileIdle: true,
    );
  }


  void _onSaveAlarm() {
    DateTime scheduleAlarmDateTime;
    if (_timeAlarm.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _timeAlarm;
    else
      scheduleAlarmDateTime = _timeAlarm.add(Duration(days: 1));

    var alarmInfo = ModelAlarm(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: _currentAlarms.length,
      title: 'alarm',
    );
    _repoAlarm.insertAlarm(alarmInfo);
    _scheduleAlarm(scheduleAlarmDateTime, alarmInfo);
    Navigator.pop(context);
    _loadAlarms();
  }


  void _deleteAlarm(int id) {
    _repoAlarm.delete(id);
    _loadAlarms();
  }


  void _showModalBottom() {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        final now = DateTime.now();
                        var selectedDateTime = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        _timeAlarm = selectedDateTime;
                        setModalState(() {
                          _textAlarm = DateFormat('HH:mm').format(selectedDateTime);
                        });
                      }
                    },
                    child: Text(
                      _textAlarm,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: _onSaveAlarm,
                    icon: Icon(Icons.alarm),
                    label: Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  @override
  void initState() {
    _timeAlarm = DateTime.now();
    _repoAlarm.initializeDatabase().then((value) {
      _loadAlarms();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Alarm',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Style.colorPrimaryText,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ModelAlarm>>(
              future: _alarms,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      'Loading..',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                _currentAlarms = snapshot.data!;
                return ListView(
                  children: snapshot.data!.map<Widget>((alarm) {
                    if (alarm.alarmDateTime == null)
                      return Container();
                    var alarmTime = DateFormat('hh:mm aa')
                      .format(alarm.alarmDateTime!);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade700,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.label,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    alarm.title ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                alarmTime,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.white,
                                onPressed: () {
                                  if (alarm.id != null)
                                    _deleteAlarm(alarm.id!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).followedBy([
                    if (_currentAlarms.length < 5)
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Style.colorClockBg,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _textAlarm = DateFormat('HH:mm').format(DateTime.now());
                            _showModalBottom();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.add_alarm),
                              SizedBox(height: 8),
                              Text(
                                'Add Alarm',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Center(
                        child: Text(
                          'Only 5 alarms allowed!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ]).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
