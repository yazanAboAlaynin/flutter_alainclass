import 'package:alainclass/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class SellCarState extends Equatable {
  const SellCarState();
  @override
  List<Object> get props => [];
}

class SellCarInitial extends SellCarState {}

class SellCarLoadInProgress extends SellCarState {}

class SellCarFinished extends SellCarState {}

class SellCarLoadFailure extends SellCarState {}
