import 'dart:async';

import 'package:meta/meta.dart';

import 'package:alainclass/repositories/api.dart';
import 'package:alainclass/models/models.dart';

class HomeRepository {
  final Api api;

  HomeRepository({@required this.api}) : assert(api != null);

  Future<List<Car>> getNewArrivals() async {
    final List<Car> cars = await api.getNewArrivals();
    return cars;
  }
}
