// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class LocalNotification {
//   static final notification = FlutterLocalNotificationsPlugin();
//
//   static Future notificationDetails() async {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'Channel id',
//           'Channel name',
//           channelDescription: 'Channel description',
//           importance: Importance.max,
//         ),
//         iOS: IOSNotificationDetails());
//   }
//
//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async {
//     notification.show(
//       id,
//       title,
//       body,
//       payload: payload,
//       await notificationDetails(),
//     );
//   }
// }
import 'package:awesome_notifications/awesome_notifications.dart';

class LocalNotification {
  static Future showNotification({required String title, required String body}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'key1',
        title: title,
        body: body,
      ),
    );
  }
}
