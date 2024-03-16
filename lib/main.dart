// import 'package:flutter/material.dart';
// import 'package:reminder_app/homepage.dart';
// import 'package:workmanager/workmanager.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
//
//
//
// void main() async{
//  await AwesomeNotifications().initialize(null, [
//    NotificationChannel(channelKey: "basic_channel",
//        channelName: "basic Notification",
//        channelDescription: "test ")
//  ]);
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: const HomePage(),
//     );
//   }
// }
//
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:reminder_app/local_noti.dart';
import 'Pages/home_page.dart';
import 'Test/notification_service.dart';
import 'home.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  await LocalNotifications.init();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationHomePage(),
    );
  }
}







