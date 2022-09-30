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
