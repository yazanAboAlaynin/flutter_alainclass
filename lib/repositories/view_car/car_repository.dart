import 'package:alainclass/repositories/repositories.dart';

import 'dart:async';

import 'package:meta/meta.dart';

class CarRepository {
  final CarApi carApi;

  CarRepository({@required this.carApi}) : assert(CarApi != null);

  Future<List> getCarPage(id) async {
    final List car_page = await carApi.getCarPage(id);
    return car_page;
  }

  Future sendEnquiries(data) async {
    await carApi.sendEnquiries(data);
  }
}
