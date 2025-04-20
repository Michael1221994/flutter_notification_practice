import 'package:flutter/material.dart';
import 'package:notification_practice/notification_service.dart';
import 'package:notification_practice/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notiService=NotiService();
  await notiService.initNotification();
  //init notifications


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}