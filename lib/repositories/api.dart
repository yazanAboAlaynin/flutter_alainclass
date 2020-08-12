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

  Future<List> getHomePage() async {
    final url = '$baseUrl/api/home-page.php';
    final response = await this.httpClient.get(url);
    if (response.statusCode != 200) {
      throw Exception('error');
    }
    List list = [];
    final result1 = jsonDecode(response.body) as Map;
    final new_arrivals = result1['new_arrivals'] as List;
    final slider_images = result1['HomePageImages'] as List;
    final List<Car> cars =
        new_arrivals.map((dynamic i) => Car.fromJson(i)).toList();

    list.add(cars);
    list.add(slider_images);

    return list;
  }
}
