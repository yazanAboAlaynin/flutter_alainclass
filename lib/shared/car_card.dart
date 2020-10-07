import 'package:alainclass/models/models.dart';
import 'package:alainclass/screens/view_car/view_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class CarCard extends StatelessWidget {
  Car car;
  CarCard({this.car});

  Widget getType(type) {
    if (type == "New") {
      return Text(
        'New',
        style: TextStyle(color: Colors.red, fontFamily: 'Gentium'),
      );
    } else if (type == "Used") {
      return Text(
        'Used',
        style: TextStyle(color: Colors.grey, fontFamily: 'Gentium'),
      );
    } else {
      return Text(
        'Sold',
        style: TextStyle(color: Colors.grey, fontFamily: 'Gentium'),
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
                Hero(
                  tag: car.id,
                  child: Container(
                    height: sizeAware.width * 0.55,
                    width: sizeAware.width,
                    child: Image.network(
                      'https://www.alainclass.com/' + car.image,
                      fit: BoxFit.cover,
                      width: sizeAware.width,
                    ),
                  ),
                ),
                Container(
                  child: Html(
                    data: """
      ${car.title}
    """,
                    style: {
                      "*": Style(
                          color: Colors.white,
                          fontSize: FontSize(sizeAware.width * 0.04),
                          fontFamily: 'Gentium'),
                    },
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
