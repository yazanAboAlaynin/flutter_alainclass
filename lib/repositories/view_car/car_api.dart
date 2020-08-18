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

  Future sendEnquiries(enquirie) async {
    final url = 'https://www.alainclass.com/wp-json/gf/v2/entries';
    String username = 'ck_dfa093fbdb2a56f7eaff320923ad613e37b24fed';
    String password = 'cs_055f79f86e1cb3b04cfab89b6fcea639ae2a138d';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var data = {
      'form_id': '1',
      '1': enquirie['name'],
      '2': enquirie['email'],
      '3': enquirie['number'],
      '4': enquirie['message']
    };
    print(basicAuth);
    final response =
        await this.httpClient.post(url, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'authorization': basicAuth,
    });
    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      throw Exception('error');
    }
    print(response.body);
  }

  Map<String, String> _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
