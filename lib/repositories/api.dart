import 'dart:convert';

import 'package:alainclass/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'https://www.alainclass.com';
  final http.Client httpClient;

  Api({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<Car>> getNewArrivals() async {
    final url = '$baseUrl/api/home-page.php';
    final response = await this.httpClient.get(url);
    if (response.statusCode != 200) {
      throw Exception('error');
    }
    final result = jsonDecode(response.body)['new_arrivals'] as List;
    final List<Car> cars = result.map((dynamic i) => Car.fromJson(i)).toList();
    return cars;
  }
}
