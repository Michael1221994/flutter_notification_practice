import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notificationsPlugin= FlutterLocalNotificationsPlugin();


  bool _isIinitialized= false;


  bool get isInitialized => _isIinitialized;


  //Initialize
  Future<void> initNotification() async{
    if(_isIinitialized) return; //prevent re-initialization

    //prepare android init settings
    const initSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');


    //prepare ios init settings
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    //init settings
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,

    );


    //initialize the plugin
    await notificationsPlugin.initialize(initSettings);
    
  }

  //Notification details setup
  NotificationDetails notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails('daily_channel_Id', 'Daily Notifications',
      channelDescription: 'Daily Notification channel',
      importance: Importance.max,
      priority: Priority.high
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  //show notification
  Future<void> showNotification({
    int id=0,
    String? title,
    String? body,
  }) async {
    return notificationsPlugin.show(id, title, body,  notificationDetails(),);  }

  // on notification Tap
}