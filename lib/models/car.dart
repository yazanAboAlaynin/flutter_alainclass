import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final int id;
  final String title;
  final String image;
  final String permalink;
  final String type;
  final String model_year;
  final String mileage;
  final String exterior;
  final String interior;
  final String engine;
  final String origin;
  final String car_type;
  final String gear_box;
  final String drive;
  final String top_speed;
  final String acceleration;
  final String displacement;
  final String power;
  final String description;

  Car(
      {this.id,
      this.title,
      this.image,
      this.permalink,
      this.type,
      this.model_year,
      this.mileage,
      this.exterior,
      this.interior,
      this.engine,
      this.origin,
      this.car_type,
      this.gear_box,
      this.drive,
      this.top_speed,
      this.acceleration,
      this.displacement,
      this.power,
      this.description});

  @override
  List<Object> get props => [
        id,
        title,
        image,
        permalink,
        type,
        model_year,
        mileage,
        exterior,
        interior,
        engine,
        origin,
        car_type,
        gear_box,
        drive,
        top_speed,
        acceleration,
        displacement,
        power,
        description
      ];

  static Car fromJson(dynamic json) {
    return Car(
      id: json["ID"],
      title: json["Title"],
      image: json["Image_ID"],
      permalink: json["permalink"],
      type: json["type"],
      model_year: json["model_year"],
      mileage: json["mileage"],
      exterior: json["exterior"],
      interior: json["interor"],
      engine: json["engine"],
      origin: json["origin"],
      car_type: json["car_type"],
      gear_box: json["gear_box"],
      drive: json["drive"],
      top_speed: json["top_speed"],
      acceleration: json["acceleration"],
      displacement: json["displacement"],
      power: json["power"],
      description: json["Description"],
    );
  }
}
