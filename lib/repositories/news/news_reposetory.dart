import 'dart:async';

import 'package:alainclass/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:alainclass/models/models.dart';

class NewsRepository {
  final NewsApi api;

  NewsRepository({@required this.api}) : assert(api != null);

  Future<List<News>> getNews() async {
    final List<News> news = await api.getNews();

    return news;
  }
}
