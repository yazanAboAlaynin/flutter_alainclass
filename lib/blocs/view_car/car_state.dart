import 'package:alainclass/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class CarState extends Equatable {
  const CarState();
  @override
  List<Object> get props => [];
}

class CarInitial extends CarState {}

class CarLoadInProgress extends CarState {}

class CarLoadSuccess extends CarState {
  final String description;
  final String main_image;
  final List images;
  final List<Car> similar_cars;

  CarLoadSuccess(
      {this.description, this.main_image, this.images, this.similar_cars});

  @override
  List<Object> get props => [description, main_image, images, similar_cars];
}

class CarLoadFailure extends CarState {}
