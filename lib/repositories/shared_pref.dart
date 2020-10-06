import 'dart:convert';

import 'package:alainclass/models/notification.dart';

import 'package:alainclass/models/notification.dart' as noti;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<List<noti.Notification>> getNotifications() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (!localStorage.containsKey('notifications')) {
      return [];
    }
    var notis = jsonDecode(localStorage.get('notifications')) as List;

    List<noti.Notification> notifications =
        notis.map((e) => noti.Notification.fromSp(e)).toList();

    return notifications;
  }

  static Future saveNotification(noti.Notification notification) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (!localStorage.containsKey('notifications')) {
      localStorage.setString('notifications', jsonEncode([]));
    }

    var notis = jsonDecode(localStorage.get('notifications')) as List;

    List<noti.Notification> notifications =
        notis.map((e) => noti.Notification.fromSp(e)).toList();
    notifications.add(notification);
    print(notifications);
    List<Map> list = noti.Notification.encodeNotifications(notifications);

    localStorage.setString('notifications', jsonEncode(list));
  }
}
