
import 'package:flutter/material.dart';

import '../Test/notification_service.dart';

class NotificationHomePage extends StatelessWidget {
  const NotificationHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    NotificationService notificationService=NotificationService();
    final hourController=TextEditingController();
    final minutesController=TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(width: 50,),
                Expanded(
                  child: TextFormField(
                    controller: hourController,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 50
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        disabledBorder: InputBorder.none,
                        fillColor: Colors.pink.withOpacity(0.1),
                        border: OutlineInputBorder(

                        )
                    ),
                  ),
                ),
                SizedBox(width: 40,),
                Expanded(
                  child: TextFormField(
                    controller: minutesController,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 50,
                    ),

                    decoration: InputDecoration(
                        filled: true,
                        disabledBorder: InputBorder.none,
                        fillColor: Colors.pink.withOpacity(0.1),
                        border: OutlineInputBorder(

                        )
                    ),
                  ),
                ),
                SizedBox(width: 50,),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                NotificationService.testScheduleNotification(hour: int.parse(hourController.text), 
                  minutes: int.parse(minutesController.text),);
              },
              child: Text("Press")),
          ElevatedButton(
              onPressed: () {
                NotificationService.showSimpleNotification(title: 'Simple',payload: "Paylod",body: "Notification");
              },
              child: Text("Press")),
          ElevatedButton(
              onPressed: () {
                NotificationService.cancelNotifications();
              },
              child: Text("Cancel"))
        ],
      ),
    );
  }
}
