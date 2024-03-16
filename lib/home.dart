
import 'package:flutter/material.dart';
import 'package:reminder_app/local_noti.dart';

import 'Test/notification_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  listenToNotifications(){
    print("Notification");
    LocalNotifications.onClickNotification.stream.listen((event) {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("local Notifications"),),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                    LocalNotifications.showSimpleNotification(
                        title: "Simple Notification",
                        body: "THis is notification",
                        payload: "This is data");
              },
              child: Icon(Icons.notifications)),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
                LocalNotifications.showPeridicNotifications(
                    title: "Period Notification",
                    body: "Hello ",
                    payload: "This is data"
                  );
              },
              child: Icon(Icons.timer_outlined)),
          ElevatedButton(
              onPressed: () {
                // NotificationService.testScheduleNotification(hour: null

                // );
              },
              child: Icon(Icons.transfer_within_a_station)),
          ElevatedButton(
              onPressed: () {
                LocalNotifications.cancelNotifications();
              },
              child: Icon(Icons.cancel))
        ],
      ),
    );
  }
}
