import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:alainclass/models/notification.dart' as noti;

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoadInProgress extends NotificationState {}

class NotificationLoadSuccess extends NotificationState {
  final List<noti.Notification> notifications;

  const NotificationLoadSuccess({
    @required this.notifications,
  }) : assert(notifications != null);

  @override
  List<Object> get props => [
        notifications,
      ];
}

class NotificationLoadFailure extends NotificationState {}
