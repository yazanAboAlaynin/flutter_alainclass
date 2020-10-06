import 'package:alainclass/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class NotificationRequested extends NotificationEvent {
  const NotificationRequested();

  @override
  List<Object> get props => [];
}
