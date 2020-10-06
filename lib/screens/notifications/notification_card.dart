import 'package:flutter/material.dart';
import 'package:alainclass/models/notification.dart' as noti;

class NotificationCard extends StatelessWidget {
  final noti.Notification notification;

  const NotificationCard({this.notification});
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: sizeAware.width,
        padding: EdgeInsets.all(8),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                    //height: sizeAware.height * 0.01,
                  ),
                ),
                SizedBox(
                  width: sizeAware.width * 0.035,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: sizeAware.width,
                          child: Text(
                            notification.title,
                            style: TextStyle(fontSize: 17),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          height: sizeAware.height * 0.02,
                        ),
                        Text(notification.message),
                        SizedBox(
                          height: sizeAware.height * 0.01,
                        ),
                        Text(notification.time.substring(0, 16)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
