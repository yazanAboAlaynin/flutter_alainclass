import 'dart:convert';

import 'package:alainclass/models/models.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

import 'package:multi_image_picker/multi_image_picker.dart';

class SellCarApi {
  static const baseUrl = 'https://www.alainclass.com';

  Future sellCar(List<Asset> assets, data) async {
    final url = '$baseUrl/api/sellyourcar.php';
    Uri uri = Uri.parse(url);

    List<MultipartFile> files = [];
    MultipartRequest request = http.MultipartRequest("POST", uri);
    int cnt = 0;
    assets.forEach((element) async {
      ByteData byteData = await element.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      MultipartFile multipartFile = http.MultipartFile.fromBytes(
        '$cnt',
        imageData,
        filename: '$cnt.jpg',
        contentType: MediaType("image", "jpg"),
      );

      files.add(multipartFile);
      request.files.insert(cnt, multipartFile);
      cnt++;
    });

    request.fields['email'] = data['email'];
    request.fields['name'] = data['name'];
    request.fields['number'] = data['number'];
    request.fields['make'] = data['make'];
    request.fields['model'] = data['model'];
    request.fields['year'] = data['year'];
    request.fields['millage'] = data['millage'];
    request.fields['price'] = data['price'];
    request.fields['notes'] = data['notes'];

    var response = await request.send();
  }

  Map<String, String> _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
