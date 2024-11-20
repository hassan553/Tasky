// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:alsooq_smart/routes/app_routes.dart';
// import 'package:alsooq_smart/services/local_db/db_helper.dart';
// import 'package:alsooq_smart/services/local_db/models/fcm_message.dart';

// Future<void> handleBackgroundMessage(RemoteMessage msg) async {
//   print('Title:${msg.notification?.title}');
//   print('Title:${msg.notification?.body}');
//   print('Title:${msg.data}');

//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   const AndroidNotificationDetails androidNotificationDetails =
//       AndroidNotificationDetails('asnan_online', 'Asnan Online',
//           channelDescription: 'Asnan online notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker');
//   const DarwinNotificationDetails darwinNotificationDetails =
//       DarwinNotificationDetails();
//   const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails, iOS: darwinNotificationDetails);
//   final locale = Get.locale == null ? 'en' : Get.locale!.languageCode;

//   final title = msg.data['title_$locale'];
//   final body = msg.data['message_$locale'] ?? "";
//   if (title != null && title.isNotEmpty) {
//     await flutterLocalNotificationsPlugin.show(
//         msg.messageId.hashCode, title, body, notificationDetails,
//         payload: jsonEncode(msg.data));
//   }
//   await saveMessageToLocalDatabase(msg);
// }

// class FirebaseApi {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;

//     Get.toNamed(AppRoutes.NotificationScreenRoute);
//   }

//   Future initPushNotification() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//             alert: true, badge: true, sound: true);
//     //from terminated state
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((value) => handleMessage(value));
//     //from background case
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(
//         (message) => handleBackgroundMessage(message));
//     //whenever there is a message
//     FirebaseMessaging.onMessage.listen((msg) async {
//       // final notification = msg.notification;
//       // if (notification == null) return;
//       // _localNotifications.show(
//       //     notification.hashCode,
//       //     notification.title,
//       //     notification.body,
//       //     NotificationDetails(
//       //       android: AndroidNotificationDetails(
//       //         _androidChannel.id,
//       //         _androidChannel.name,
//       //         channelDescription: _androidChannel.description,
//       //         icon: '@drawable/ic_launcher',
//       //       ),
//       //     ),
//       //     payload: jsonEncode(msg.toMap()));
//       // await saveMessageToLocalDatabase(msg);

//       final channelId = "appointments";
//       final channelName = "Appointments Updates";

//       final channelDescribtion = "Latest Appointments Updates and remainders.";

//       var androidNotificationDetails = AndroidNotificationDetails(
//           channelId, channelName,
//           channelDescription: channelDescribtion,
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: channelName);
//       const DarwinNotificationDetails darwinNotificationDetails =
//           DarwinNotificationDetails(
//         presentAlert: true,
//         presentBadge: true,
//         interruptionLevel: InterruptionLevel.timeSensitive,
//       );
//       NotificationDetails notificationDetails = NotificationDetails(
//           android: androidNotificationDetails, iOS: darwinNotificationDetails);
//       final locale = Get.locale == null ? 'en' : Get.locale!.languageCode;
//       final title = msg.data['title_$locale'];
//       final body = msg.data['message_$locale'] ?? "";
//       if (title != null && title.isNotEmpty) {
//         await _localNotifications.show(
//             msg.messageId.hashCode, title, body, notificationDetails,
//             payload: jsonEncode(msg.data));
//         await saveMessageToLocalDatabase(msg);
//       }
//     });
//   }

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     initPushNotification();
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

//     initLocalNotifications();
//   }

//   //now for local notifications
//   final _androidChannel = const AndroidNotificationChannel(
//     'asnan_online',
//     'Asnan Online',
//     description: 'Asnan online notifications',
//     importance: Importance.max,
//     playSound: true,
//   );
//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   Future initLocalNotifications() async {
//     const ios = DarwinInitializationSettings();
//     const android = AndroidInitializationSettings('@drawable/ic_launcher');
//     const settings = InitializationSettings(android: android, iOS: ios);
//     await _localNotifications.initialize(settings,
//         onDidReceiveNotificationResponse: (payload) {
//       final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));

//       handleMessage(message);
//     });

//     final platform = _localNotifications.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//     await platform?.createNotificationChannel(_androidChannel);
//   }
// }
// // Save the FCM message to the local database

// Future saveMessageToLocalDatabase(RemoteMessage message) async {
//   final locale = Get.locale == null ? 'en' : Get.locale!.languageCode;

//   final fcmMessage = FCMMessage(
//     title: message.data['title_$locale'] ?? ' ',
//     body: message.data['message_$locale'] ?? ' ',
//     viewed: 0,
//     timestamp: DateTime.now(),
//   );

//   await DatabaseHelper.instance.insertMsg(fcmMessage);
// }
