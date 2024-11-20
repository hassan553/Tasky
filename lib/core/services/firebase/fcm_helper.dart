import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tt/firebase_options.dart';

import 'awesome_notifications_helper.dart';

class FcmHelper {
  FcmHelper._();
  static late FirebaseMessaging messaging;
  static Future<void> initFcm() async {
    try {
      // initialize fcm and firebase core
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      // initialize firebase
      messaging = FirebaseMessaging.instance;
      if (Platform.isIOS) {
        FirebaseMessaging.instance.requestPermission();
      }
      // notification settings handler
      await _setupFcmNotificationSettings();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
     
    }
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  ///handle fcm notification when app is closed/terminated
  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
      actionButtons: [
        // NotificationActionButton(
        //   key: 'Accept',
        //   label: 'Accept',
        //   autoDismissible: true,
        // ),
        // NotificationActionButton(
        //   key: 'Reject',
        //   label: 'Reject',
        //   autoDismissible: true,
        // ),
      ],
    );
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
      actionButtons: [
        // NotificationActionButton(
        //   key: 'Accept',
        //   label: 'Accept',
        //   autoDismissible: true,
        // ),
        // NotificationActionButton(
        //   key: 'Reject',
        //   label: 'Reject',
        //   autoDismissible: true,
        // ),
      ],
    );
  }
}
