import 'package:alainclass/blocs/notification/notification_event.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/repositories/shared_pref.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:alainclass/models/notification.dart' as noti;

import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial());

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is NotificationRequested) {
      yield NotificationLoadInProgress();
      try {
        List<noti.Notification> notifications =
            await SharedPrefs.getNotifications();
        notifications = List.from(notifications.reversed);
        yield NotificationLoadSuccess(notifications: notifications);
      } catch (_) {
        yield NotificationLoadFailure();
      }
    }
  }
}
