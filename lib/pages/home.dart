import 'package:flutter/material.dart';
import 'package:notification_practice/notification_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await NotiService().showNotification(
              title: "Title",
              body: "body"
            );
          },
          child: const Text("Send Notification"),
          ),),
    );
  }
}