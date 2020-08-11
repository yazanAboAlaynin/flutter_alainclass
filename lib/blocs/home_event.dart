import 'package:alainclass/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeRequested extends HomeEvent {
  const HomeRequested();

  @override
  List<Object> get props => [];
}
