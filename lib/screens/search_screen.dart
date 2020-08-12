import 'package:alainclass/models/models.dart';
import 'package:alainclass/shared/show_cars.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  List<Car> new_arrivals = [];

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: sizeAware.width * 0.4,
          //height: sizeAware.height * 0.01,
        ),
        actions: <Widget>[
          Icon(
            Icons.call,
            size: sizeAware.width * 0.1,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ShowCars(
          cars: new_arrivals,
        ),
      ),
    );
  }
}
