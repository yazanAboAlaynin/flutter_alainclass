class Notification {
  String id;
  String title;
  String message;
  String time;
  bool status;

  Notification({this.id, this.message, this.time, this.title, this.status});

  static Notification fromJson(json) {
    return Notification(
        id: json.notificationId,
        title: json.title,
        message: json.body,
        time: DateTime.now().toString(),
        status: false);
  }

  static Notification fromSp(json) {
    return Notification(
        id: json['id'],
        title: json['title'],
        message: json['message'],
        time: json['time'],
        status: json['status']);
  }

  static Map<String, dynamic> toMap(Notification c) {
    var d = {
      'id': c.id,
      'title': c.title,
      'message': c.message,
      'time': c.time,
      'status': c.status
    };

    return d;
  }

  static List<Map> encodeNotifications(List<Notification> items) => items
      .map<Map<String, dynamic>>((item) => Notification.toMap(item))
      .toList();
}
