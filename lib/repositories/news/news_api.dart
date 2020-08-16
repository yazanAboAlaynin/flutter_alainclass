import 'dart:convert';

import 'package:alainclass/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static const baseUrl = 'https://www.alainclass.com';
  final http.Client httpClient;

  NewsApi({
    @required this.httpClient,
  }) : assert(httpClient != null);

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
}
