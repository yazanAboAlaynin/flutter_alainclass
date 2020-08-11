import 'package:alainclass/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<Car> new_arrivals;

  const HomeLoadSuccess({@required this.new_arrivals})
      : assert(new_arrivals != null);

  @override
  List<Object> get props => [new_arrivals];
}

class HomeLoadFailure extends HomeState {}
