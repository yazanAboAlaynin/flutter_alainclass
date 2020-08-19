import 'dart:async';

import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/repositories/sell_car/sell_car_api.dart';
import 'package:meta/meta.dart';
import 'package:alainclass/models/models.dart';

class SellCarRepository {
  final SellCarApi api;

  SellCarRepository({@required this.api}) : assert(api != null);

  Future sellCar(assets, data) async {
    await api.sellCar(assets, data);
  }
}
