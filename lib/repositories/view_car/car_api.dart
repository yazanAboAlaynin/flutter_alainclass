import 'dart:convert';

import 'package:alainclass/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CarApi {
  static const baseUrl = 'https://www.alainclass.com';
  final http.Client httpClient;

  CarApi({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List> getCarPage(id) async {
    final url = '$baseUrl/api/car-details.php';
    Map data = {'id': id};
    final response = await this
        .httpClient
        .post(url, body: jsonEncode(data), headers: _setHeaders());

    if (response.statusCode != 200) {
      throw Exception('error');
    }

    List list = [];
    final result1 = jsonDecode(response.body) as Map ?? Map();
    final description = result1['Description'] ?? [];
    final main_image = result1['MainImage'] ?? [];
    final images = result1['Images'] as List ?? [];
    final similar_cars = result1['similarcars'] as List ?? [];
    final List<Car> cars =
        similar_cars.map((dynamic i) => Car.fromJson(i)).toList() ?? [];

    list.add(description);
    list.add(main_image);
    list.add(images);
    list.add(cars);

    print(images);

    return list;
  }

  Map<String, String> _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
