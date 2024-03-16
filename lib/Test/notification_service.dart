
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    // AndroidInitializationSettings("@mipmap/ic_launcher");
    AndroidInitializationSettings("download");

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

  }

//Simple notifications
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails,
        payload: payload);
  }

  static Future<void> testScheduleNotification({required int hour, required int minutes}) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Dhaka'));
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    print(tz.TZDateTime.now(tz.local));
    final  now = tz.TZDateTime.now(tz.local);
    print(now);
    // Get current date

    // Create 1:38 PM time
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour,minutes);


    // If the scheduled time is before the current time, schedule it for the next day
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }








    //Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'Scheduled Title',
      'Scheduled Body',
      // tz.TZDateTime.now(tz.local).add(Duration(seconds: 1)),
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true, // Allow notification even when the device is idle
    );




    int totalNotification=60;

    for(int i=2;i<totalNotification;i++){
      await flutterLocalNotificationsPlugin.zonedSchedule(
          i,
          "title",
          "body",
          scheduledDate.add(Duration(minutes: i)),
          NotificationDetails(
              android: AndroidNotificationDetails("channelId",
                "channelName",

                channelDescription: 'your channel description',
                importance: Importance.max,
                priority: Priority.high,
                color: Colors.red

              )
          ),

          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
    }


  }

  static Future<void> cancelNotifications() async {
    print("cancel");
    await flutterLocalNotificationsPlugin.cancelAll();
  }


}



