import 'package:alainclass/models/models.dart';
import 'package:flutter/material.dart';

import 'car_card.dart';

class ShowCars extends StatelessWidget {
  List<Car> cars;

  ShowCars({this.cars});

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];
    for (int i = 0; i < cars.length; i++) {
      Widget w = CarCard(
        car: cars.elementAt(i),
      );
      res.add(w);
    }
    return Column(
      children: res,
    );
  }
}
