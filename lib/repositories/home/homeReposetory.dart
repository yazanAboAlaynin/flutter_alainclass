import 'dart:async';

import 'package:meta/meta.dart';

import 'package:alainclass/repositories/home/api.dart';
import 'package:alainclass/models/models.dart';

class HomeRepository {
  final Api api;

  HomeRepository({@required this.api}) : assert(api != null);

  Future<List> getHomePage() async {
    final List home_page = await api.getHomePage();
    final List search_list = await api.getSearchList();
    final List latest_news = await api.getNews();
    home_page.add(search_list);
    home_page.add(latest_news);
    return home_page;
  }

  Future<List<Car>> search(brand, year, neworused) async {
    final List<Car> cars = await api.search(brand, year, neworused);
    return cars;
  }
}
