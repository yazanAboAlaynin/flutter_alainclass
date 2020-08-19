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
    final result1 = jsonDecode(response.body) as Map ?? Map();
    final new_arrivals = result1['new_arrivals'] as List ?? [];
    final slider_images = result1['HomePageImages'] as List ?? [];
    final List<Car> cars =
        new_arrivals.map((dynamic i) => Car.fromJson(i)).toList() ?? [];

    list.add(cars);
    list.add(slider_images);

    return list;
  }

  Future<List> getSearchList() async {
    final url = '$baseUrl/api/searchlist.php';
    final response = await this.httpClient.get(url);
    if (response.statusCode != 200) {
      throw Exception('error');
    }
    final result1 = jsonDecode(response.body) ?? [];
    final search_list = result1 as List ?? [];

    return search_list;
  }

  Future<List<News>> getNews() async {
    final url = '$baseUrl/api/news.php';
    final response = await this.httpClient.post(url);
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception('error');
    }

    final result = jsonDecode(response.body)['news'] as List;
    final List<News> news =
        result.map((dynamic i) => News.fromJson(i)).toList();

    return news;
  }

  Future<List<Car>> search(brand, year, neworused) async {
    final url = '$baseUrl/api/searchresult.php';
    Map<String, String> data = {
      "brand": brand,
      "year": year,
      "neworused": neworused
    };
    final response = await this
        .httpClient
        .post(url, body: jsonEncode(data), headers: _setHeaders());
    if (response.statusCode != 200) {
      throw Exception('error');
    }
    final result = jsonDecode(response.body) as List;
    final List<Car> cars = result.map((dynamic i) => Car.fromJson(i)).toList();

    return cars;
  }

  Map<String, String> _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
