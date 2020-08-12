import 'dart:async';

import 'package:meta/meta.dart';

import 'package:alainclass/repositories/api.dart';
import 'package:alainclass/models/models.dart';

class HomeRepository {
  final Api api;

  HomeRepository({@required this.api}) : assert(api != null);

  Future<List> getHomePage() async {
    final List home_page = await api.getHomePage();
    return home_page;
  }
}
