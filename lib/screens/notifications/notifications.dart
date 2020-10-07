import 'package:alainclass/blocs/notification/notification_bloc.dart';
import 'package:alainclass/blocs/notification/notification_event.dart';
import 'package:alainclass/blocs/notification/notification_state.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:alainclass/models/notification.dart' as noti;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'notification_card.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<noti.Notification> notifications = [];
  NotificationBloc notificationBloc;
  calling() async {
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    notificationBloc = NotificationBloc();
    notificationBloc.add(NotificationRequested());
    super.initState();
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return BlocBuilder(
        cubit: notificationBloc,
        builder: (context, state) {
          if (state is NotificationInitial) {
            return Container();
          }
          if (state is NotificationLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NotificationLoadSuccess) {
            notifications = state.notifications;
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.black,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 45,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Image.asset(
                  'assets/images/black_logo.png',
                  fit: BoxFit.cover,
                  width: 130,
                  //height: sizeAware.height * 0.01,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 6, 2),
                    child: IconButton(
                      icon: Icon(
                        Icons.call,
                        size: 40,
                      ),
                      onPressed: calling,
                    ),
                  ),
                ],
              ),
              drawer: Container(
                width: sizeAware.width,
                child: Drawer(
                  child: MyDrawer(),
                ),
              ),
              body: Container(
                child: CustomScrollView(slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      getList(notifications),
                    ),
                  ),
                ]),
              ),
            );
          }
          if (state is NotificationLoadFailure) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      notificationBloc.add(NotificationRequested());
                    },
                    child: Text('Try Again')),
              ),
            );
          }
        });
  }

  getList(List<noti.Notification> notis) {
    List<NotificationCard> list = [];
    for (int i = 0; i < notis.length; i++) {
      Widget w = NotificationCard(
        notification: notis[i],
      );
      list.add(w);
    }
    return list;
  }
}
