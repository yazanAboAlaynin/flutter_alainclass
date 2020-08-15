import 'package:alainclass/models/models.dart';
import 'package:alainclass/screens/view_car/view_car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  Car car;
  CarCard({this.car});

  Widget getType(type) {
    if (type == "New") {
      return Text(
        'New',
        style: TextStyle(
          color: Colors.red,
        ),
      );
    } else {
      return Text(
        'Used',
        style: TextStyle(
          color: Colors.grey,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewCar(
                        car: car,
                      )));
        },
        child: Container(
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: sizeAware.height * 0.34,
                  width: sizeAware.width,
                  child: Image.network(
                    'https://www.alainclass.com/' + car.image,
                    fit: BoxFit.cover,
                    width: sizeAware.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    car.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 4.0),
                  child: getType(car.type),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
