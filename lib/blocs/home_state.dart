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
  final List slider_images;
  final List search_list;

  const HomeLoadSuccess(
      {@required this.new_arrivals,
      @required this.slider_images,
      @required this.search_list})
      : assert(new_arrivals != null &&
            slider_images != null &&
            search_list != null);

  @override
  List<Object> get props => [new_arrivals, slider_images];
}

class SearchLoadSuccess extends HomeState {
  final List<Car> cars;

  const SearchLoadSuccess({
    @required this.cars,
  }) : assert(cars != null);

  @override
  List<Object> get props => [cars];
}

class HomeLoadFailure extends HomeState {}
