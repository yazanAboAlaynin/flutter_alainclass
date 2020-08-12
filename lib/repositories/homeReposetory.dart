import 'dart:async';

import 'package:meta/meta.dart';

import 'package:alainclass/repositories/api.dart';
import 'package:alainclass/models/models.dart';

class HomeRepository {
  final Api api;

  HomeRepository({@required this.api}) : assert(api != null);

  Future<List> getHomePage() async {
    final List home_page = await api.getHomePage();
    final List search_list = await api.getSearchList();
    home_page.add(search_list);
    return home_page;
  }

  Future<List<Car>> search(brand, year, neworused) async {
    final List<Car> cars = await api.search(brand, year, neworused);
    return cars;
  }
}
