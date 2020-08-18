import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();
}

class CarRequested extends CarEvent {
  final int id;

  CarRequested({this.id});

  @override
  List<Object> get props => [id];
}

class SendEnquiries extends CarEvent {
  final Map<String, String> data;

  SendEnquiries({this.data});

  @override
  List<Object> get props => [data];
}
